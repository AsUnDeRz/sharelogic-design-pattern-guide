
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



### Example Usecase Android
//UseCase ต้องมาจาก Module Platform เท่านั้นนะครับ ตอนนี้ถ้าพิมมันจะขึ้นเห็นสอง UseCase เลยครับจากทั้ง Domain Platform เดี๋ยวตรงนี้ผมหาวิธีแก้อีกทีหลังครับ
```
import com.theconcert.platform.auth.RegisterUseCase 

val usecase = RegisterUseCase()

  usecase.register("0812341","123441234")
            .subscribeOn(scheduler.io())
            .observeOn(scheduler.ui())
            .subscribe({
                it.data
                it.error
            },{
                print(it)
            })
```
### Example Usecase IOS
```
import Platform

let usecase = RegisterUseCase()

usecase.register(username: "user", password: "asdf")
            .subscribe(onNext: { (response) in
                response.data
                response.error
            }, onError: { (error) in
                print(error)
            })
```

### ตัว Response ที่ได้จาก onNext ทั้งหมดผมได้ทำการ map เป็น Model ทั้งหมดแล้วครับโดยจะมีแค่สอง state
### 200-300 มี data แต่ error จะเท่ากับ null
### 400 ขึ่นไป จะมี error แต่ data จะเป็น null แทน
### ส่วนถ้าเข้าเคส onError นั้นคือจะเป็น error ที่ Api thowable มาเองเลยครับ

### หมายเหตุ เพราะข้อมูลที่ได้จาก Api เป็นแบบ dynamic ครับโดยมี 2 node หลักๆ คือ "data":{} และ "error":{}
### ผมจึงต้องทำให้ Model รองรับทั้งสองโหนด พี่อาจจะเช็ค state จาก null ได้เลยครับเพราะถ้าได้ Response มาถูกต้องจะมี node สักตัวที่มีค่ามาแน่ๆครับ

Android

    it.data?.let {
        openActivity()
    }
    it.error?.let {
        showDialog()
    }


IOS

    if response.data != nil {
        openViewController()
    }
    if response.error != nil {
        showDialog()
    }
