#include <stdio.h>
#include <ctype.h> // isalpha(), tolower()

// returns 1 if str is palindrome, 0 if not.
int is_palindrome(char str[]);

int main()
{
	char str[] = "A man, a plan, a canal, Panama.";
	printf("%d\n", is_palindrome(str));
	return 0;
}

int is_palindrome(char str[])
{
	int i;
	for (i = 0; str[i] != '\0'; i++)
		; // do nothing

	int left = 0, right = i-1;
	char c1, c2;
	while (left < right)
	{
		if (isalpha(str[left]))
			c1 = tolower(str[left]);
		else
		{
			left++;
			continue;
		}

		if (isalpha(str[right]))
			c2 = tolower(str[right]);
		else
		{
			right--;
			continue;
		}

		// now c1, c2 are letters
		if (c1 != c2)
			return 0; // not palindrome

		left++;
		right--;
	}
	return 1;
}

/*
	char s1[] = {'W', 'i', 'n', 't', 'e', 'r', '\0', 'i', 'm', 'e'};
	char s2[] = "Winter";
	printf("%s\n%s\n", s1, s2);
*/
