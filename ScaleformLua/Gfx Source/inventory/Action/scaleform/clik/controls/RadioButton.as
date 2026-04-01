package scaleform.clik.controls
{

    public class RadioButton extends Button
    {
        public static const DEFAULT_GROUPNAME:String = "default";

        public function RadioButton()
        {
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            this.toggle = true;
            allowDeselect = false;
            if (_group == null)
            {
                this.groupName = DEFAULT_GROUPNAME;
            }
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

        override public function get groupName() : String
        {
            return super.groupName;
        }// end function

        override public function set groupName(param1:String) : void
        {
            super.groupName = param1;
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK RadioButton " + name + "]";
        }// end function

    }
}
