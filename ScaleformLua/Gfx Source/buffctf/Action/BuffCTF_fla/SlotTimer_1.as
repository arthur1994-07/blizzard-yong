package BuffCTF_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class SlotTimer_1 extends MovieClip
    {
        public var slot:Slot;
        public var bar:StatusIndicator;

        public function SlotTimer_1()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.bar, true);
            return;
        }// end function

    }
}
