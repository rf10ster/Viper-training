@protocol NewsServiceInterface <NSObject>

- (void)getNewsWithCompletion:(void (^)(NSArray *errorMessages, NSArray *baseNewsEntities))fetchBlock;
@end
