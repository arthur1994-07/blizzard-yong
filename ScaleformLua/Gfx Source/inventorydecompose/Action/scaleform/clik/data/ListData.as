package scaleform.clik.data
{

    public class ListData extends Object
    {
        public var index:uint = 0;
        public var label:Array;
        public var selected:Boolean = false;

        public function ListData(param1:uint, param2:Array, param3:Boolean = false)
        {
            this.label = ["Empty"];
            this.index = param1;
            this.label = param2;
            this.selected = param3;
            return;
        }// end function

        public function toString() : String
        {
            return "[ListData " + this.index + ", " + this.selected + "]";
        }// end function

    }
}
