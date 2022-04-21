@namespaceAccessible
global class StackTraceObj {
	@AuraEnabled
	@InvocableVariable
		global String cls;
	@AuraEnabled
	@InvocableVariable
		global String line;
	@AuraEnabled
	@InvocableVariable
		global String method;
	@AuraEnabled
	@InvocableVariable
		global String stackTraceString;
}