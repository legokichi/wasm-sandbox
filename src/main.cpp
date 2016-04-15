#include <iostream>
//#include <boost/random.hpp>
/*
int get_rand(unsigned long seed, int min, int max){
  using namespace boost;
  mt19937 gen(seed);
  uniform_smallint<> dst( min, max );
  variate_generator<
    mt19937&, uniform_smallint<>
  > rand( gen, dst );
  return rand();
}
*/

int main(int argc, char *argv[]){
  using namespace std;
  cout << "hello world" << endl;
  //cout << get_rand(1, 1, 1000) << endl;
  return 0;
}
