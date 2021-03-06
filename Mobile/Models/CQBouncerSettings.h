#import "MVChatConnection.h"

@interface CQBouncerSettings : NSObject {
	NSString *_identifier;
	NSString *_displayName;
	NSString *_server;
	NSString *_username;
	NSString *_password;
	unsigned short _serverPort;
	BOOL _pushNotifications;
	MVChatConnectionBouncer _type;
}
- (id) initWithDictionaryRepresentation:(NSDictionary *) info;

- (NSMutableDictionary *) dictionaryRepresentation;

@property (nonatomic, readonly) NSString *identifier;

@property (nonatomic) MVChatConnectionBouncer type;

@property (nonatomic, copy) NSString *displayName;

@property (nonatomic, copy) NSString *server;
@property (nonatomic) unsigned short serverPort;

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

@property (nonatomic) BOOL pushNotifications;
@end
