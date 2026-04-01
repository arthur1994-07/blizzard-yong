package VehicleColor_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class colorLine_2 extends MovieClip
    {
        public var labelName:Label;
        public var color1:MColorView;
        public var color2:MColorView;

        public function colorLine_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_color1_colorLine_asset_0();
            this.__setProp_color2_colorLine_asset_0();
            return;
        }// end function

        function __setProp_color1_colorLine_asset_0()
        {
            try
            {
                this.color1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.color1.enabled = true;
            this.color1.text = "Color1";
            this.color1.visible = true;
            try
            {
                this.color1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_color2_colorLine_asset_0()
        {
            try
            {
                this.color2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.color2.enabled = true;
            this.color2.text = "Color2";
            this.color2.visible = true;
            try
            {
                this.color2["componentInspectorSetting"] = false;
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
