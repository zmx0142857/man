%------------------------%
% Help For New Matlabers %
%------------------------%

% Basic math calculation

>> (5*2 + 1.3 - 0.8)*10^2/25

ans = 
	42

% Variables
%
%	Creating variables is easy. By default the type is 8-Byte 'double'.

>> x = 42
x =
	42
>> x = 42;		% append semicolon ';' to suppress the output


% Who
%
%	Now who's in the workspace?

>> who

Your variables are:

ans  x

>> whos
  Name      Size            Bytes  Class     Attributes

  ans       1x1                 8  double              
  x         1x1                 8  double

% Save & Load

>> save filename [-ascii] [variable, ...]
>> load filename

% Clear 
%
%	Those variables are of no use...

>> clear all

% Help
 
>> help <topic>
>> lookfor <keyword>
>> help help	% just try it! useful!

% Clean
%
%	After using help, the screen gets dirty. Let's clean it.

>> clc

% Math Functions
%
%	abs		angle	sqrt	real	imag	conj	round	fix		floor
%	ceil	rat		rats	sign	sin		cos		tan		asin	acos
%	atan	atan2	sinh	cosh	tanh	asinh	acosh	atanh

% Format
%
%	Use 'format *' to set format. Some frequently used formats:
%
%	compact	- output less blanks and spaces
%	loose	- oppose to above
%	long	- show 15 digits for double and 7 digits for single, 
%			  this is default
%	short	- show 5 digits whatever
%	rat		- display float numbers as ratio

% Vectors and matrices - important!

>> x = [7 2 5];		% row vector
>> x = [7,2,5];		% same as above
>> x = [7;2;5];		% column vector
>> x = x';			% transpose x

>> A = [1 2 3; 4 5 6; 7 8 10];	% a matrix

% Concatenate
%
%	Square brackets '[]' are concatenate operators. When elements are
%	seperated with space or comma, the operation is horizontal, and when
%	elements are seperated with semicolon, it is vertical.

>> B = [A x']
B =
	1	2	3	7
	4	5	6	2
	7	8	10	5

% Indexing

>> x(2) = 6			% x = 7 6 5
>> x(5) = 10		% x = 7 6 5 0 10
>> x(3) = []		% x = 7 6 0 10
>> x(2:4)			% ans = 6 0 10

>> A(3, 2)			% ans = 8
>> A(6)				% ans = 8
>> A(2, 2:3)		% ans = 5 6
>> A(:, 3)			% ans = [3 6 10]'

% Functions for vectors and matrices
%
%	min		max		mean	median	std		diff	sort	length	norm
%	sum		prod	cumsum	cumprod	dot		cross

% ; and ...
%
%	Semicolon seperate statements; Dots extends the long statements to...
%	next line

% Consts
%
%	pi		eps		inf		nan		realmax	realmin	nargin

% If-statement and for-loop
%
%	tips: copy and save the text as filename.m then in matlab console type
%
%		>> filename
%
%	to run.

n_samples = 5;
n_points = 50;

for k = 1:n_samples
    iteration_str = ['Iteration #', int2str(k)];
    disp(iteration_str)
    current_data = rand(n_points,1);
    sample_mean(k) = mean(current_data)
end

overall_mean = mean(sample_mean)

if overall_mean < 0.49
    disp('Mean is less than expected')
elseif overall_mean > 0.51
    disp('Mean is greater than expected')
else
    disp('Mean is within the expected range')
end

% Function

function output = fact(n)
	% FACT Calculate factorial of a given positive integer.
	output = 1;
	for i = 1:n
		output = output * i;
	end

% Recursive Function

function output = fact(n)
	if n == 0 || n == 1
		output = 1;
		return;
	end
	output = n * fact(n-1); 

% Some unix-like commands: 
%
%	ls		cd		pwd		type	more	delete	path	which
%	home	iskeyword		diary

% Id-process
%
%	When processing an id-name, matlab follows the sequence:
%
%	user variable --> const --> current directory file 
%	--> path directory file --> error message
