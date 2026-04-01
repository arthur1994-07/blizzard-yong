package PostBoxProposeRing_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var ProRingInfo:TextField;
        public var RingBg:MovieClip;
        public var slot1:Slot;
        public var SendButton:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_slot1_Scene1_item_0();
            return;
        }// end function

        function __setProp_slot1_Scene1_item_0()
        {
            try
            {
                this.slot1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot1.overlayImg = "ring_symbol";
            this.slot1.visible = true;
            try
            {
                this.slot1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
