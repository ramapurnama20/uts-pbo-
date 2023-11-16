#include <bits/stdc++.h>

using namespace std;
class Geeks {
public:
	// fungsi dengan 1 parameter int
	void func(int x)
	{
		cout << "value of x is " << x << endl;
	}

	// fungsi dengan mana yang sama tapi
	// 1 parameter ganda
	void func(double x)
	{
		cout << "value of x is " << x << endl;
	}

	// fungsi dengan nama yang sama dan
	// 2 paramater int
	void func(int x, int y)
	{
		cout << "value of x and y is " << x << ", " << y
			<< endl;
	}
};

// Driver code
int main()
{
	Geeks obj1;

	// fungsi yang dipanggil tergantung
	// pada paremeter yang dilewati
	// fungsi() dianggil dengan nilai int
	obj1.func(7);

	// fungsi() dipanggil dengan nilai ganda
	obj1.func(9.132);

	// fungsi() dipanggil dengan nilai 2 int
	obj1.func(85, 64);
	return 0;
}
