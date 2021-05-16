#include <iostream>
using namespace std;

int main()
{
    int curval=0,val=0,cnt=1;
    if(cin>>curval){
        while(cin>>val){
            if(curval==val)
            ++cnt;
            
            else{
            cout<<"occur "<<cnt<<" times"<<endl;
            curval=val;
            cnt=1;
            }
        }
    }
    return 0;
}
