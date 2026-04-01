package ActivityRecord_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class RecommendPlace_56 extends MovieClip
    {
        public var MapListTitle:Label;
        public var MapInfoTitle:Label;
        public var textRecommendInfo:TextArea;
        public var MapInfoText:TextArea;
        public var MapInfoTextScrollBar:ScrollBar;
        public var textRecommendInfoScrollBar:ScrollBar;

        public function RecommendPlace_56()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_textRecommendInfo_RecommendPlace_Layer1_0();
            this.__setProp_textRecommendInfoScrollBar_RecommendPlace_Layer1_0();
            this.__setProp_MapInfoText_RecommendPlace_Layer1_0();
            this.__setProp_MapInfoTextScrollBar_RecommendPlace_Layer1_0();
            return;
        }// end function

        function __setProp_textRecommendInfo_RecommendPlace_Layer1_0()
        {
            try
            {
                this.textRecommendInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.textRecommendInfo.defaultText = "";
            this.textRecommendInfo.displayAsPassword = false;
            this.textRecommendInfo.editable = false;
            this.textRecommendInfo.enabled = true;
            this.textRecommendInfo.focusable = false;
            this.textRecommendInfo.maxByte = 0;
            this.textRecommendInfo.maxChars = 2;
            this.textRecommendInfo.minThumbSize = 1;
            this.textRecommendInfo.OnlyNumber = false;
            this.textRecommendInfo.Restrict = "all";
            this.textRecommendInfo.RestrictAddOn = "";
            this.textRecommendInfo.scrollBar = "textRecommendInfoScrollBar";
            this.textRecommendInfo.text = "";
            this.textRecommendInfo.textAlign = "left";
            this.textRecommendInfo.thumbOffset = {top:0, bottom:0};
            this.textRecommendInfo.visible = true;
            try
            {
                this.textRecommendInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_textRecommendInfoScrollBar_RecommendPlace_Layer1_0()
        {
            try
            {
                this.textRecommendInfoScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.textRecommendInfoScrollBar.enabled = true;
            this.textRecommendInfoScrollBar.minThumbSize = 10;
            this.textRecommendInfoScrollBar.offsetBottom = 0;
            this.textRecommendInfoScrollBar.offsetTop = 0;
            this.textRecommendInfoScrollBar.scrollTarget = "textRecommendInfo";
            this.textRecommendInfoScrollBar.trackMode = "scrollPage";
            this.textRecommendInfoScrollBar.visible = true;
            try
            {
                this.textRecommendInfoScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_MapInfoText_RecommendPlace_Layer1_0()
        {
            try
            {
                this.MapInfoText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.MapInfoText.defaultText = "";
            this.MapInfoText.displayAsPassword = false;
            this.MapInfoText.editable = false;
            this.MapInfoText.enabled = true;
            this.MapInfoText.focusable = false;
            this.MapInfoText.maxByte = 0;
            this.MapInfoText.maxChars = 0;
            this.MapInfoText.minThumbSize = 1;
            this.MapInfoText.OnlyNumber = false;
            this.MapInfoText.Restrict = "all";
            this.MapInfoText.RestrictAddOn = "";
            this.MapInfoText.scrollBar = "MapInfoTextScrollBar";
            this.MapInfoText.text = "";
            this.MapInfoText.textAlign = "left";
            this.MapInfoText.thumbOffset = {top:0, bottom:0};
            this.MapInfoText.visible = true;
            try
            {
                this.MapInfoText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_MapInfoTextScrollBar_RecommendPlace_Layer1_0()
        {
            try
            {
                this.MapInfoTextScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.MapInfoTextScrollBar.enabled = true;
            this.MapInfoTextScrollBar.minThumbSize = 10;
            this.MapInfoTextScrollBar.offsetBottom = 0;
            this.MapInfoTextScrollBar.offsetTop = 0;
            this.MapInfoTextScrollBar.scrollTarget = "MapInfoText";
            this.MapInfoTextScrollBar.trackMode = "scrollPage";
            this.MapInfoTextScrollBar.visible = true;
            try
            {
                this.MapInfoTextScrollBar["componentInspectorSetting"] = false;
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
