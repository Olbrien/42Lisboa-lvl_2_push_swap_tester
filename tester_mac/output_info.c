#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <math.h>

int main()
{
	int fd;
	int	number = 0;
	int first_lap = 1;
	int minimum = 0;
	int maximum = 0;
	float median = 0;
	char buf[5000];
	int i = 0;

	fd = open("results.txt", O_RDWR);

	while (read(fd, &buf[i], 1) > 0)
	{
		if (buf[i] == '\n' || buf[i] == '\0')
		{
			buf[i] = '\0';
			number = atoi(buf);
			median += number;
			if (first_lap == 1)
				minimum = number;
			else if (minimum > number)
				minimum = number;
			if (maximum < number)
				maximum = number;
			first_lap = 0;
			i = 0;
		}
		else
			i++;
	}

	median = median / 100;

	median = round(median);

	printf("Minimum instructions: %i\n", minimum);
	printf("Maximum instructions: %i\n", maximum);
	printf("Average of instructions: %i\n", (int)median);


}
