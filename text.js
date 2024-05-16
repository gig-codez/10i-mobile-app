function Fox(color){
    this.color =  color;
}
    Fox.prototype.Fox = function(){
        console.log("I am "+this.color);
    }
let x = new Fox("red");
setTimeout(x.Fox,1000);