package 
{
    import flash.display.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class PlayerLv extends MovieClip
    {
        public var PlayerLvlText:Label;
        public var gender_img:UIComponent;

        public function PlayerLv()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_PlayerLvlText_PlayerLv_Layer1_0();
            return;
        }// end function

        function __setProp_PlayerLvlText_PlayerLv_Layer1_0()
        {
            try
            {
                this.PlayerLvlText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.PlayerLvlText.autoSize = "center";
            this.PlayerLvlText.autoSizeEnable = false;
            this.PlayerLvlText.enabled = true;
            this.PlayerLvlText.text = "";
            this.PlayerLvlText.visible = true;
            try
            {
                this.PlayerLvlText["componentInspectorSetting"] = false;
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
