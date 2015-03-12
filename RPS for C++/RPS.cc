#include <iostream>
#include <cstdlib>
#include <cmath>
#include <ctime>

using namespace std;

int main()
{
	
	int quit;
	
	while(quit == -1){
		int player;
		int opponent;
		
		cout << "1.Rock" << endl;
		cout << "2.Paper" << endl;
		cout << "3.Scissors" << endl;
		
		cin >> player;
		cout << endl;
		
		opponent = (rand()%3)+1;
		
		if(player == -1)
		{
			return 0;
		}
		if(opponent == player)
		{
			cout << "Draw! Try again!" << endl;
		}
			
		if((player == 1 && opponent == 3)||
		   (player == 2 && opponent == 1)||
		   (player == 3 && opponent == 2))
		{
			cout <<"You beat the computer! Congrats!" << endl;
		}
		else
		{
			cout << "You lost to a computer... how terrible..." << endl;
		}
	}
		
	
	return 0;
}

