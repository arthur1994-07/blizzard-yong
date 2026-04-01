package 
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class HpDisplayBlue extends MovieClip
    {
        public var textField:TextField;
        public var barHP:StatusIndicator;

        public function HpDisplayBlue()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_barHP_HpDisplayBlue_Layer1_0();
            return;
        }// end function

        function __setProp_barHP_HpDisplayBlue_Layer1_0()
        {
            try
            {
                this.barHP["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.barHP.enabled = true;
            this.barHP.maximum = 100;
            this.barHP.minimum = 0;
            this.barHP.value = 0;
            this.barHP.visible = true;
            try
            {
                this.barHP["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this, true);
            return;
        }// end function

    }
}
