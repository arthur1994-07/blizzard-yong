package GameOption_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcSound_2 extends MovieClip
    {
        public var sliderEffect:Slider;
        public var sliderEnvironment:Slider;
        public var sliderBGM:Slider;
        public var checkEffect:CheckBox;
        public var checkEnvironment:CheckBox;
        public var checkBGM:CheckBox;
        public var checkEffect_text:Label;
        public var checkEnvironment_text:Label;
        public var checkBGM_text:Label;

        public function mcSound_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_sliderEffect_mcSound_asset_0();
            this.__setProp_sliderEnvironment_mcSound_asset_0();
            this.__setProp_sliderBGM_mcSound_asset_0();
            return;
        }// end function

        function __setProp_sliderEffect_mcSound_asset_0()
        {
            try
            {
                this.sliderEffect["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sliderEffect.enabled = true;
            this.sliderEffect.focusable = false;
            this.sliderEffect.liveDragging = true;
            this.sliderEffect.maximum = 10;
            this.sliderEffect.minimum = 0;
            this.sliderEffect.offsetLeft = 0;
            this.sliderEffect.offsetRight = 0;
            this.sliderEffect.snapInterval = 1;
            this.sliderEffect.snapping = false;
            this.sliderEffect.value = 0;
            this.sliderEffect.visible = true;
            try
            {
                this.sliderEffect["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_sliderEnvironment_mcSound_asset_0()
        {
            try
            {
                this.sliderEnvironment["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sliderEnvironment.enabled = true;
            this.sliderEnvironment.focusable = false;
            this.sliderEnvironment.liveDragging = true;
            this.sliderEnvironment.maximum = 10;
            this.sliderEnvironment.minimum = 0;
            this.sliderEnvironment.offsetLeft = 0;
            this.sliderEnvironment.offsetRight = 0;
            this.sliderEnvironment.snapInterval = 1;
            this.sliderEnvironment.snapping = false;
            this.sliderEnvironment.value = 0;
            this.sliderEnvironment.visible = true;
            try
            {
                this.sliderEnvironment["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_sliderBGM_mcSound_asset_0()
        {
            try
            {
                this.sliderBGM["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sliderBGM.enabled = true;
            this.sliderBGM.focusable = false;
            this.sliderBGM.liveDragging = true;
            this.sliderBGM.maximum = 10;
            this.sliderBGM.minimum = 0;
            this.sliderBGM.offsetLeft = 0;
            this.sliderBGM.offsetRight = 0;
            this.sliderBGM.snapInterval = 1;
            this.sliderBGM.snapping = false;
            this.sliderBGM.value = 0;
            this.sliderBGM.visible = true;
            try
            {
                this.sliderBGM["componentInspectorSetting"] = false;
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
