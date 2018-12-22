
# Share Logic Design Pattern Guide

## Concept

- แบ่งโครงสร้างแยกเป็นส่วนๆ
- แชร์ Business Logic ระหว่าง Platform Android & IOS โดยต้องไม่มีโค้ดเฉพาะจงเจาะในแต่ละ Platform เช่น 
import UIKIT 
import com.android.**



#### Domain 

`Domain` หมายถึง ส่วนที่รวบรวมการทำงานพื้นฐานของแอฟพลิเคชั่น ประกอบไปด้วย UseCase , Entities 
ภายใน UseCase หรือ Entities ต้องไม่มีการ Implementation มาจากส่วนอื่น


#### Platform

`Platform` คือ ส่วนที่ Implementation จาก `Domain` และ Libary หรือ framwork อื่นๆ เฉพาะเจาะจงของแต่ละ Platform Android & IOS


----> Platform

------> Utils

------> Common 

------> ModuleName //ชื่อโมดูล เช่น Auth

--------> ModuleUseCase  // UseCase ที่ Implementation จาก Domain

--------> UiNameProvider  // Class ที่รวบรวม UseCase ต่างๆใน 1 UI 

--------> ModuleApi 



#### Application or App
`Application` คือส่วนที่รวมรวบ User interface และส่วนที่ต้อง Implementation สำหรับ Presenter หรือ ViewModel ตาม Design Pattern ต่างๆ (MVVM, MVC , MVP) 
Android -> Activity , Fragment , ViewModel , Presenter ,etc
IOS -> UIView , UIViewController , ViewModel , etc