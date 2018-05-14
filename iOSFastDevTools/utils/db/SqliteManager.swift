//
//  SqliteManager.swift
//  iOSFastDevTools
//
//  Created by zcw on 2018/4/16.
//  Copyright © 2018年 zcw. All rights reserved.
//

//  SQLiteManager.swift
//  01-FMDB基本使用
//  Copyright © 2016年 ming. All rights reserved.

import UIKit

class SQLiteManager: NSObject {
    
    /// 单例
    static let shareInstance: SQLiteManager = SQLiteManager()
    
    override init() {
        super.init()
        openDB(name: "demo.sqlite")
    }
    
    var db: FMDatabase?
    func openDB(name: String)
    {
        // 1.拼接路径
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as! String

        let path = documentsFolder.appending(name)
        
        // 2.创建数据库对象
        db = FMDatabase(path: path)
        
        // 3.打开数据库
        // open()特点: 如果数据库文件不存在就创建一个新的, 如果存在就直接打开
        if !db!.open()
        {
            print("打开数据库失败")
            return
        }
        
        // 4.创建表
        if !createTable()
        {
            print("创建数据库失败")
            return
        }
    }
    
    /**
     创建表
     */
    func createTable() ->Bool
    {
        // 1.编写SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS T_Person( \n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
            "name TEXT, \n" +
            "age INTEGER \n" +
        ");"
        
        // 2.执行SQL语句
        // 注意: 在FMDB中, 除了查询以外的操作都称之为更新
        return db!.executeUpdate(sql, withArgumentsIn: [])
    }
}

