package ran.ui.data
{

    public class Widget extends Object
    {
        public var id:uint;
        public var className:String;
        public var fname:String;
        public var path:String;
        public var isWindow:Boolean;
        public var isModal:Boolean;
        public var escCloseable:Boolean;
        public var closeToDelete:Boolean;
        public var xcoord:int;
        public var ycoord:int;
        public var layer:int;
        public var align:int;
        public var offsetX:int;
        public var offsetY:int;
        public var LoadCompleteCall:String;
        public var OpenCall:String;
        public var saveProp:Boolean;
        public var snapping:Boolean;

        public function Widget(param1:uint, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:Boolean, param18:Boolean)
        {
            this.id = param1;
            this.path = param2;
            this.className = param3;
            this.fname = param4;
            this.isWindow = param7;
            this.isModal = param8;
            this.escCloseable = param9;
            this.closeToDelete = param10;
            this.xcoord = param11;
            this.ycoord = param12;
            this.layer = param13;
            this.align = param14;
            this.offsetX = param15;
            this.offsetY = param16;
            this.LoadCompleteCall = param5;
            this.OpenCall = param6;
            this.saveProp = param17;
            this.snapping = param18;
            return;
        }// end function

    }
}
