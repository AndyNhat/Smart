#include <ESP8266WiFi.h>
#include "FirebaseESP8266.h"
#include <ArduinoJson.h>
#include <DHTesp.h>
#include <SoftwareSerial.h>

#define WIFI_SSID "TVLNhat"                        
#define WIFI_PASSWORD "12345678"  

#define FIREBASE_HOST "doantt-203e1-default-rtdb.asia-southeast1.firebasedatabase.app"    
// Insert Firebase Database secret
#define FIREBASE_AUTH "ZAEPk9AcsL9m12gjyX6kGJDEjVU9kYHyI5mLDaC6"
FirebaseData firebaseData;
String path = "/";
FirebaseJson json;
#define RX_PIN 4 // Chân RX của EspSoftwareSerial
#define TX_PIN 5 // Chân TX của EspSoftwareSerial
// Định nghĩa kiểu cảm biến DHT lDHT11 và số chân GPIO kết nối với cảm biến là 16
#define DHTTYPE DHTesp::DHT11
#define DHTPIN 16
// Tạo một đối tượng DHT để làm việc với cảm biến
DHTesp dht;
// int cambien = 12;
// int giatri;
const char* host = "api.openweathermap.org";
String api_key = "da4bb13d6073c9dabd396044d9dcb7fe";
String lat = "15.947421";
String lon = "108.257679";
// Tạo một đối tượng JsonDocument có dung lượng 100 byte
StaticJsonDocument<1024> docc;// Tạo một đối tượng JsonDocument có dung lượng 100 byte
SoftwareSerial mySerial(RX_PIN , TX_PIN ); // RX, TX

byte x=0;
byte den=0;
byte y=0;
byte z=0;
byte loaicay = 0;

int value, real_value;
void setup() {
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);            
  Serial.print("Connecting to ");
  Serial.print(WIFI_SSID);
  while (WiFi.status() != WL_CONNECTED) 
  {
    Serial.print(".");
    delay(500);
  }
   Serial.println();
  Serial.print("Connected to ");
  Serial.println(WIFI_SSID);
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);//connect to firebase
  Firebase.reconnectWiFi(true);
  if(!Firebase.beginStream(firebaseData,path)){
    Serial.println("RESON :" +firebaseData.errorReason());
    Serial.println();
  } 
  Serial.print("connection with ip: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  dht.setup(DHTPIN, DHTTYPE);
    pinMode(14,INPUT_PULLUP);
    pinMode(12,INPUT);

  // Khởi tạo cổng nối tiếp ảo
  mySerial.begin(9600);
}

void loop() {
//-------------------------------
if (Firebase.getInt(firebaseData,path+"/chedo")) x=firebaseData.intData();
if (Firebase.getInt(firebaseData,path+"/den")) den=firebaseData.intData();
if (Firebase.getInt(firebaseData,path+"/relay")) y=firebaseData.intData();
if (Firebase.getInt(firebaseData,path+"/servo")) z=firebaseData.intData();
if (Firebase.getInt(firebaseData,path+"/Loaicaytrong")) loaicay=firebaseData.intData();
//--------------------------
 // Đọc giá trị nhiệt độ và độ ẩm từ cảm biến
  float temperature = dht.getTemperature();
  float humidity = dht.getHumidity();
  // Kiểm tra xem các giá trị có hợp lệ hay không
  if (isnan(temperature) || isnan(humidity)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

  //Đọc dữ liệu Analog của cảm biến độ ẩm đất
for (int i = 0; i <10; i++) {
real_value += analogRead(A0);
}
value = real_value/10;
real_value = 0; //đặt lại giá trị biến bằng 0 
int percent = map(value,200,1024,0,100);
percent = 100 - percent;//tính giá trị % thực 
 Serial.print("do am cua dat la : ");Serial.print(percent); 
 Serial.print("%");
 Serial.print("       ");
 Serial.print("do am cua dat cu the : ");Serial.print(value);
Serial.println("");
//------
// giatri = digitalRead(cambien);  
// Serial.print("gia tri cua quang tro : ");Serial.println(giatri);
 //------------------------
//doc du lieu api
WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    Serial.println("Kết nối thất bại");
    return;
  }
  // Tạo URL cho yêu cầu GET.
   String url = "http://api.openweathermap.org/data/2.5/forecast?lat=" + lat + "&lon=" + lon + "&appid=" + api_key;

  Serial.print("Yêu cầu URL: ");
  Serial.println(url);
  
  // Gửi yêu cầu đến máy chủ.
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");
  // Bỏ qua tiêu đề HTTP.
  while (client.connected()) {
    String line = client.readStringUntil('\n');
    if (line == "\r") {
      break;
    }
  }

  // Đọc nội dung phản hồi.
  String line;
  while (client.available()) {
    line = client.readStringUntil('\r');
  }

  // Tạo đối tượng JSON từ phản hồi.
  DynamicJsonDocument doc(5120);
  deserializeJson(doc, line);
 Serial.print("Dữ liệu JSON đầy đủ: ");
  Serial.println(line);
  // Lấy dữ liệu lượng mưa từ phản hồi JSON
  float mua3h = doc["list"][0]["rain"]["3h"];
  float muah = doc["list"][6]["rain"]["3h"];
// In dữ liệu lượng mưa ra màn hình
Serial.print("Lượng mưa trong 3 giờ : ");
Serial.print(mua3h);Serial.println(" mm");
Serial.print("Lượng mưa trong 3 giờ ngay tiep theo  : ");
Serial.print(muah);Serial.println(" mm");
// Lấy dữ liệu trạng thái thời tiết từ phản hồi JSON
String trangThai = doc["list"][0]["weather"][0]["main"];

// In dữ liệu trạng thái thời tiết ra màn hình
Serial.println("Trạng thái thời tiết: " + trangThai);

//-------------------
 // Gán giá trị nhiệt độ và độ ẩm vào đối tượng JsonDocument
  docc["temperature"] = temperature;
  docc["humidity"] = humidity;
  docc["luongmua"] = mua3h; 
 docc["ngaymai"] = muah;
  docc["doamdat"]= percent;
  // docc["giatri"]= giatri;
  docc["x"]= x;
  docc["y"]= y;
  docc["z"]= z;
  docc["den"]= den;
  docc["loaicay"]=loaicay; 

 // Chuyển đổi đối tượng JsonDocument thành chuỗi JSON và gửi nó qua cổng nối tiếp ảo
  serializeJson(docc, mySerial);
  mySerial.println();

  // Chuyển đổi đối tượng JsonDocument thành chuỗi JSON và gửi nó qua cổng nối tiếp thật
  serializeJson(docc, Serial);
  Serial.println();


  Firebase.setInt(firebaseData,path+"/Do am dat ",percent);
  Firebase.setFloat(firebaseData,path+"/Do am",humidity);
  Firebase.setFloat(firebaseData,path+"/Luong mua",mua3h);
  Firebase.setFloat(firebaseData,path+"/Luong mua ngay mai",muah);
  Firebase.setFloat(firebaseData,path+"/Nhiet do",temperature);
  Firebase.setString(firebaseData,path+"/Trang thai",trangThai);
  if(temperature > 27){
   Firebase.setString(firebaseData,path+"/canhBao","Troi rat nang nong");
  }if(mua3h>= 1.0 && percent >= 65){
    Firebase.setString(firebaseData,path+"/canhBao","mua roi ngap roi");
  }else{
    Firebase.setString(firebaseData,path+"/canhBao"," ");
  }


//----------------------
delay(500); // Đợi 0.5 giây trước khi thực hiện lần đọc tiếp theo.
}
