#include <stdio.h>
#include <string.h>

int
main(void)
{
	char *buf = strdup("earth!");
	snprintf(buf, 6, "%s", "world!");
	printf("hello, %s!\n", buf);
}
