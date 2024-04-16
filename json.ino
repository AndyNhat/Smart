// Khai báo thư viện cần thiết
#include <ArduinoJson.h>
#include<Servo.h>
// Khai báo thư viện SoftwareSerial
#include <SoftwareSerial.h>

#define RX_PIN 10 // Chân RX của cổng nối tiếp mềm
#define TX_PIN 11 // Chân TX của cổng nối tiếp mềm
#define relay 5

#define ledd 3
#define lede 9
int servo = 8;
Servo myServo;



 DynamicJsonDocument doc(512);
SoftwareSerial mySerial(RX_PIN, TX_PIN); // Tạo một đối tượng cổng nối tiếp mềm

// Tạo một đối tượng JsonDocument có dung lượng 100 byte


void setup() {
  // Khởi tạo giao tiếp nối tiếp với tốc độ baud là 9600
  Serial.begin(9600);
  // Khởi tạo cổng nối tiếp ảo
  mySerial.begin(9600);
   pinMode(relay,OUTPUT);
   digitalWrite(relay,LOW);

  pinMode(ledd,OUTPUT);
  digitalWrite(ledd,HIGH);

  pinMode(lede,OUTPUT);
  digitalWrite(lede,HIGH);

  myServo.attach(servo);

}

void loop() {
    // Kiểm tra xem có dữ liệu nào sẵn sàng trên cổng nối tiếp ảo hay không
    if (mySerial.available()) {
      // Đọc một dòng từ cổng nối tiếp ảo
      String line = mySerial.readStringUntil('\n');
      
      // Chuyển đổi chuỗi JSON thành đối tượng JsonDocument
      DeserializationError error = deserializeJson(doc, line);

      // Kiểm tra xem có lỗi nào trong quá trình chuyển đổi hay không
      if (error) {
        Serial.print("deserializeJson() failed: ");
        Serial.println(error.c_str());
        return;
      }

      // Lấy giá trị nhiệt độ và độ ẩm từ đối tượng JsonDocument
      float temperature = doc["temperature"];
      float humidity = doc["humidity"];
      float luongmua = doc["luongmua"];
     float ngaymai = doc["ngaymai"];
      float doamdat = doc["doamdat"];
      int x = doc["x"];
      int y = doc["y"];
      int z = doc["z"];
      int den = doc["den"];
      int loaicay = doc["loaicay"];


      // In các giá trị ra màn hình nối tiếp
      Serial.print("Temperature: ");
      Serial.print(temperature);
      Serial.println(" C");
      Serial.print("Humidity: ");
      Serial.print(humidity);
      Serial.println(" %");
      Serial.print("lượng mưa: ");
      Serial.println(luongmua);
      // Serial.print("lượng mưa ngay mai: ");
       Serial.println(ngaymai);
      Serial.print("độ ẩm đất: ");
    Serial.println(doamdat);
      

    if (x==1) {
    //digitalWrite(relay,HIGH);
    //digitalWrite(ledd,LOW);
    //  myServo.write(0);
  //digitalWrite(ledd,LOW);
  //Servo
  digitalWrite(lede,HIGH);
     Serial.println("Tắt đèn");
 if((luongmua<=15 && doamdat <=65) || temperature<= 28){
   myServo.write(0);
   Serial.println("mo servo");
   digitalWrite(ledd,HIGH);
 }else if((luongmua>= 1.0 && doamdat >= 65) || temperature >= 28){
   myServo.write(180);
   Serial.println("dong servo");
   digitalWrite(ledd,LOW);
 }else{
   myServo.write(0);
   Serial.println("mo servo");
   digitalWrite(ledd,HIGH);
 }
 if(temperature > 27){
   digitalWrite(relay,LOW);
   Serial.println("Đóng relay");
 }
 if (loaicay == 0) {
  Serial.println("Rau cải!--------");
  if(temperature <27 ){
          if(luongmua>3.0){
              digitalWrite(relay,LOW);
              Serial.println("Tắt Relay1");
             } 
          if(luongmua<2.0 && ngaymai > 2.0){
             if(doamdat<20){
                digitalWrite(relay,HIGH);
                Serial.println("Bật Relay2");
             }if(doamdat >20){
                  digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay2");
               }
          }
          if(luongmua<2.0 && ngaymai < 2.0){
               if(doamdat<30){
                  digitalWrite(relay,HIGH);
                  Serial.println("Bật Relay3");
               } if(doamdat >30){
                digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay3");
                }
          }else{
            digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay4");
          }
  }
   }
  
  if (loaicay == 1) {
  Serial.println("Dưa hấu!--------");
  if(temperature <27 ){
          if(luongmua>3.0){
              digitalWrite(relay,LOW);
              Serial.println("Tắt Relay1");
             } 
          if(luongmua<3.0 && ngaymai > 3.0){
             if(doamdat<30){
                digitalWrite(relay,HIGH);
                Serial.println("Bật Relay2");
             }if(doamdat >30){
                  digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay2");
               }
          }
          if(luongmua<3.0 && ngaymai < 3.0){
               if(doamdat<50){
                  digitalWrite(relay,HIGH);
                  Serial.println("Bật Relay3");
               } if(doamdat >50){
                digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay3");
                }
          }else{
            digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay4");
          }
  } 
  } 
  
   if (loaicay == 2) {
  Serial.println("Cà tím!--------");
  if(temperature <27 ){
          if(luongmua>3.0){
              digitalWrite(relay,LOW);
              Serial.println("Tắt Relay1");
             } 
          if(luongmua<2.0 && ngaymai > 2.0){
             if(doamdat<20){
                digitalWrite(relay,HIGH);
                Serial.println("Bật Relay2");
             }if(doamdat >20){
                  digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay2");
               }
          }
          if(luongmua<2.0 && ngaymai < 2.0){
               if(doamdat<30){
                  digitalWrite(relay,HIGH);
                  Serial.println("Bật Relay3");
               } if(doamdat >30){
                digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay3");
                }
          }else{
            digitalWrite(relay,LOW);
                 Serial.println("Tắt Relay4");
          }
  }
   }  
    }else {
      Serial.println("Thủ công");
    // myServo.write(180);
    //digitalWrite(lede,HIGH);
    if (y==1) {
    digitalWrite(relay,HIGH);
    Serial.println("Mở relay");
    }else{
     digitalWrite(relay,LOW);
    Serial.println("Đóng relay"); 
    }
  if (z==1) {
    myServo.write(-20);
    Serial.println("Mở Servo");
    }else{
     myServo.write(180);
    Serial.println("Đóng Servo"); 
    }
    if (den==1) {
    digitalWrite(lede,LOW);
    Serial.println("Mở đèn"); 
    }else{
     digitalWrite(lede,HIGH);
     Serial.println("Tắt đèn"); 
    }
    }
    }
}