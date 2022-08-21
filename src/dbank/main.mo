import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;

  let id = 236484684683;
  stable var startTime = Time.now();

  public func topUp(amount: Float) {
      currentValue += amount;
      Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float) {
    let temp: Float = currentValue - amount;
    if(temp >=0){
      currentValue += amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount to large");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };
  
  // compound based on senconds
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNs = currentTime - startTime;
    let timeElapsedS = timeElapsedNs / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

}