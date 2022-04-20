@namespaceAccessible
global class StackTraceUtil {
	global static StackTraceObj logUtilStackTrace() {
		StackTraceObj rst = new StackTraceObj();
		try {
			Integer x = 0 / 0;
		} catch (Exception e) {
			rst.line = e.getLineNumber();
			rst.stackTraceString = e.getStackTraceString();
				String stLineOne = rst.stackTraceString.substringBefore('\n');
			rst.cls = stLineOne.substringAfter('.').substringBefore('.');
			rst.method = stLineOne.substringBefore(':').substringAfter(rst.cls).substringAfter('.');
		}
		return rst;
	}
}