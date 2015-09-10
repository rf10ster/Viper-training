
@protocol NewsDataManagerInterface <NSObject>

- (void)fetchNewsWithCompletion:(void (^)(NSArray *errorMessages, NSArray *baseNewsEntities))fetchBlock;
@end