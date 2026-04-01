package ran.ui
{
    import flash.events.*;
    import flash.text.*;

    public class LoadingScreenEvent extends Event
    {
        public var id:int = -1;
        public var tf:TextField;
        public static const UpdateText:String = "updateText";

        public function LoadingScreenEvent(param1:int, param2:TextField)
        {
            super(UpdateText, false, false);
            this.id = param1;
            this.tf = param2;
            return;
        }// end function

    }
}
