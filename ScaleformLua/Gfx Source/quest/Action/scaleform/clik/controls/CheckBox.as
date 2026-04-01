package scaleform.clik.controls
{

    public class CheckBox extends Button
    {

        public function CheckBox()
        {
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            _toggle = true;
            return;
        }// end function

        override public function get autoRepeat() : Boolean
        {
            return false;
        }// end function

        override public function set autoRepeat(param1:Boolean) : void
        {
            return;
        }// end function

        override public function get toggle() : Boolean
        {
            return true;
        }// end function

        override public function set toggle(param1:Boolean) : void
        {
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK CheckBox " + name + "]";
        }// end function

    }
}
