package BasicInfo_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class infoHP_5 extends MovieClip
    {
        public var tfTitle:TextField;
        public var tfValue:TextField;
        public var barValue:StatusIndicator;

        public function infoHP_5()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.tfTitle, true);
            InteractiveObjectEx.setHitTestDisable(this.tfValue, true);
            return;
        }// end function

    }
}
