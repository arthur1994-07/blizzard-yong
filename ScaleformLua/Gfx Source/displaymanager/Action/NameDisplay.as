package 
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.core.*;
    import scaleform.gfx.*;

    dynamic public class NameDisplay extends MovieClip
    {
        public var mcSchoolIcon:DisplaySchoolIcon;
        public var tfName:TextField;
        public var barHP:displayHP;
        public var mcParty:MovieClip;
        public var tfClub:TextField;
        public var rtClubIcon:DefaultRenderTexture;
        public var mcCountryImg:UIComponent;

        public function NameDisplay()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_barHP_NameDisplay_HP_0();
            return;
        }// end function

        function __setProp_barHP_NameDisplay_HP_0()
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
