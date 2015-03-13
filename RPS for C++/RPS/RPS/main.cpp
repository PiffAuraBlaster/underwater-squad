//
//  main.m
//  RPS
//
//  Created by Kyle Napod on 3/13/15.
//  Copyright (c) 2015 Kyle Napod. All rights reserved.
//

#include <iostream>
#include <cstdlib>
#include <cmath>
#include <ctime>
#include <Gosu/Gosu.hpp>
#include <Gosu/TR1.hpp>
#include <Gosu/AutoLink.hpp>
#include <list>
#include <sstream>
#include <vector>

using namespace std;

class GameWindow : public Gosu::Window
{
    std::auto_ptr<Gosu::Image> backgroundImage;
public:
    GameWindow()
    :   Window(640, 480, false)
    {
        setCaption(L"SUPER AMAZING ROCK PAPER SCISSORS PALOOZA");
    }
    
    void update()
    {
        // ...
    }
    
    void draw()
    {
        // ...
    }
};
int main()
{
    {
        GameWindow window;
        window.show();
    }
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