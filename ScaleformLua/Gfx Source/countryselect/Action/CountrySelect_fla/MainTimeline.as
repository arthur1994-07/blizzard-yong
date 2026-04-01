package CountrySelect_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var tfCountry:TextField;
        public var btnSelect:Button;
        public var mcCountryImg:UIComponent;
        public var bg:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnSelect_Scene1_Layer2_0();
            return;
        }// end function

        function __setProp_btnSelect_Scene1_Layer2_0()
        {
            try
            {
                this.btnSelect["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSelect.autoRepeat = false;
            this.btnSelect.autoSize = "none";
            this.btnSelect.enabled = true;
            this.btnSelect.focusable = false;
            this.btnSelect.groupName = "";
            this.btnSelect.label = "";
            this.btnSelect.overlayAlign = "none";
            this.btnSelect.overlayImg = "";
            this.btnSelect.overlayPadding = {x:0, y:0};
            this.btnSelect.preventAutoSize = true;
            this.btnSelect.selected = false;
            this.btnSelect.toggle = false;
            this.btnSelect.visible = true;
            try
            {
                this.btnSelect["componentInspectorSetting"] = false;
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
