package 
{
    import flash.display.*;

    dynamic public class radioSex_r extends MovieClip
    {
        public var radio_Male:ToggleButton_NoText_66x66;
        public var radio_Female:ToggleButton_NoText_66x66;

        public function radioSex_r()
        {
            this.__setProp_radio_Male_radioSex_r_asset_0();
            this.__setProp_radio_Female_radioSex_r_asset_0();
            return;
        }// end function

        function __setProp_radio_Male_radioSex_r_asset_0()
        {
            try
            {
                this.radio_Male["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.radio_Male.autoRepeat = false;
            this.radio_Male.autoSize = "none";
            this.radio_Male.enabled = true;
            this.radio_Male.focusable = true;
            this.radio_Male.groupName = "radioSex";
            this.radio_Male.label = "";
            this.radio_Male.overlayAlign = "none";
            this.radio_Male.overlayImg = "sex_male";
            this.radio_Male.overlayPadding = {x:0, y:0};
            this.radio_Male.selected = false;
            this.radio_Male.toggle = true;
            this.radio_Male.visible = true;
            try
            {
                this.radio_Male["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_radio_Female_radioSex_r_asset_0()
        {
            try
            {
                this.radio_Female["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.radio_Female.autoRepeat = false;
            this.radio_Female.autoSize = "none";
            this.radio_Female.enabled = true;
            this.radio_Female.focusable = true;
            this.radio_Female.groupName = "radioSex";
            this.radio_Female.label = "";
            this.radio_Female.overlayAlign = "none";
            this.radio_Female.overlayImg = "sex_female";
            this.radio_Female.overlayPadding = {x:0, y:0};
            this.radio_Female.selected = false;
            this.radio_Female.toggle = true;
            this.radio_Female.visible = true;
            try
            {
                this.radio_Female["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
