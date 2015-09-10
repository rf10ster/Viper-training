//
//  AppDelegate.h
//  RamblerRss
//
//  Created by Aleksey Kiselev on 19/08/15.
//  Copyright (c) 2015 Aleksey Kiselev. All rights reserved.
//
/*
 Задание “RSS-reader”.
 
 Приложение должно отображать новости в одном списке, отсортированном по дате
 
 публикации, из двух источников - http://lenta.ru/rss и http://www.gazeta.ru/export/rss/lenta.xml.
 
 Приложение должно указывать в новости ее источник (lenta.ru или gazeta.ru). Новость должна
 
 иметь два режима отображения – обычный и расширенный.
 
 В обычном выводятся элементы: картинка, заголовок. В расширенном добавляется краткое
 
 описание новости. Режим отображения должен меняться по тапу на новость.
 
 Сделайте, пожалуйста, акцент на на viper/tdd при реализации.
 */
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

