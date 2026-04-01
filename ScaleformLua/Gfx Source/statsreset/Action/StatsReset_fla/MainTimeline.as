package StatsReset_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var topText:TextArea;
        public var BottomText:TextArea;
        public var StaticInfoPow:Label;
        public var StaticInfoDex:Label;
        public var StaticInfoSpi:Label;
        public var StaticInfoStr:Label;
        public var StaticInfoSta:Label;
        public var StaticInfoPoint:Label;
        public var labelPowOrig:Label;
        public var labelDexOrig:Label;
        public var labelSpiOrig:Label;
        public var labelStrOrig:Label;
        public var labelStaOrig:Label;
        public var labelPowAdd:Label;
        public var labelDexAdd:Label;
        public var labelSpiAdd:Label;
        public var labelStrAdd:Label;
        public var labelStaAdd:Label;
        public var labelPowReturn:Label;
        public var labelDexReturn:Label;
        public var labelSpiReturn:Label;
        public var labelStrReturn:Label;
        public var labelStaReturn:Label;
        public var labelPowReturnAdd:Label;
        public var labelDexReturnAdd:Label;
        public var labelSpiReturnAdd:Label;
        public var labelStrReturnAdd:Label;
        public var labelStaReturnAdd:Label;
        public var infoPoint:Label;
        public var setPoint:Label;
        public var infoStats:Label;
        public var setStats:Label;
        public var returnSkillMoney:Label;
        public var returnStatsPoint:Label;
        public var returnItem:Label;
        public var returnSkillPoint:Label;
        public var returnItemCount:Label;
        public var ReturnList:ScrollingList;
        public var scrollBar:ScrollBar;
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var item3:ListItemRenderer;
        public var item4:ListItemRenderer;
        public var item5:ListItemRenderer;
        public var item6:ListItemRenderer;
        public var RefreshButton:Button;
        public var OkButton:Button;
        public var CloseButton:Button;
        public var btnUpPow:Button;
        public var btnDownPow:Button;
        public var btnUpDex:Button;
        public var btnDownDex:Button;
        public var btnUpSpi:Button;
        public var btnDownSpi:Button;
        public var btnUpStr:Button;
        public var btnDownStr:Button;
        public var btnUpSta:Button;
        public var btnDownSta:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_RefreshButton_Scene1_button_0();
            this.__setProp_CloseButton_Scene1_button_0();
            this.__setProp_OkButton_Scene1_button_0();
            this.__setProp_btnUpPow_Scene1_button_0();
            this.__setProp_btnDownPow_Scene1_button_0();
            this.__setProp_btnUpDex_Scene1_button_0();
            this.__setProp_btnDownDex_Scene1_button_0();
            this.__setProp_btnUpSpi_Scene1_button_0();
            this.__setProp_btnDownSpi_Scene1_button_0();
            this.__setProp_btnUpStr_Scene1_button_0();
            this.__setProp_btnDownStr_Scene1_button_0();
            this.__setProp_btnUpSta_Scene1_button_0();
            this.__setProp_btnDownSta_Scene1_button_0();
            this.__setProp_infoStats_Scene1_text_0();
            this.__setProp_setStats_Scene1_text_0();
            this.__setProp_returnSkillMoney_Scene1_text_0();
            this.__setProp_infoPoint_Scene1_text_0();
            this.__setProp_setPoint_Scene1_text_0();
            this.__setProp_BottomText_Scene1_text_0();
            this.__setProp_topText_Scene1_text_0();
            this.__setProp_returnSkillPoint_Scene1_text_0();
            return;
        }// end function

        function __setProp_RefreshButton_Scene1_button_0()
        {
            try
            {
                this.RefreshButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RefreshButton.autoRepeat = false;
            this.RefreshButton.autoSize = "none";
            this.RefreshButton.enabled = true;
            this.RefreshButton.focusable = false;
            this.RefreshButton.groupName = "";
            this.RefreshButton.label = "";
            this.RefreshButton.overlayAlign = "none";
            this.RefreshButton.overlayImg = "";
            this.RefreshButton.overlayPadding = {x:0, y:0};
            this.RefreshButton.selected = false;
            this.RefreshButton.toggle = false;
            this.RefreshButton.visible = true;
            try
            {
                this.RefreshButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CloseButton_Scene1_button_0()
        {
            try
            {
                this.CloseButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CloseButton.autoRepeat = false;
            this.CloseButton.autoSize = "none";
            this.CloseButton.enabled = true;
            this.CloseButton.focusable = false;
            this.CloseButton.groupName = "";
            this.CloseButton.label = "";
            this.CloseButton.overlayAlign = "none";
            this.CloseButton.overlayImg = "";
            this.CloseButton.overlayPadding = {x:0, y:0};
            this.CloseButton.selected = false;
            this.CloseButton.toggle = false;
            this.CloseButton.visible = true;
            try
            {
                this.CloseButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_OkButton_Scene1_button_0()
        {
            try
            {
                this.OkButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.OkButton.autoRepeat = false;
            this.OkButton.autoSize = "none";
            this.OkButton.enabled = true;
            this.OkButton.focusable = false;
            this.OkButton.groupName = "";
            this.OkButton.label = "";
            this.OkButton.overlayAlign = "none";
            this.OkButton.overlayImg = "";
            this.OkButton.overlayPadding = {x:0, y:0};
            this.OkButton.selected = false;
            this.OkButton.toggle = false;
            this.OkButton.visible = true;
            try
            {
                this.OkButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnUpPow_Scene1_button_0()
        {
            try
            {
                this.btnUpPow["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUpPow.autoRepeat = true;
            this.btnUpPow.autoSize = "none";
            this.btnUpPow.enabled = true;
            this.btnUpPow.focusable = false;
            this.btnUpPow.groupName = "";
            this.btnUpPow.label = "";
            this.btnUpPow.overlayAlign = "none";
            this.btnUpPow.overlayImg = "";
            this.btnUpPow.overlayPadding = {x:0, y:0};
            this.btnUpPow.selected = false;
            this.btnUpPow.toggle = false;
            this.btnUpPow.visible = true;
            try
            {
                this.btnUpPow["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDownPow_Scene1_button_0()
        {
            try
            {
                this.btnDownPow["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDownPow.autoRepeat = true;
            this.btnDownPow.autoSize = "none";
            this.btnDownPow.enabled = true;
            this.btnDownPow.focusable = false;
            this.btnDownPow.groupName = "";
            this.btnDownPow.label = "";
            this.btnDownPow.overlayAlign = "none";
            this.btnDownPow.overlayImg = "";
            this.btnDownPow.overlayPadding = {x:0, y:0};
            this.btnDownPow.selected = false;
            this.btnDownPow.toggle = false;
            this.btnDownPow.visible = true;
            try
            {
                this.btnDownPow["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnUpDex_Scene1_button_0()
        {
            try
            {
                this.btnUpDex["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUpDex.autoRepeat = true;
            this.btnUpDex.autoSize = "none";
            this.btnUpDex.enabled = true;
            this.btnUpDex.focusable = false;
            this.btnUpDex.groupName = "";
            this.btnUpDex.label = "";
            this.btnUpDex.overlayAlign = "none";
            this.btnUpDex.overlayImg = "";
            this.btnUpDex.overlayPadding = {x:0, y:0};
            this.btnUpDex.selected = false;
            this.btnUpDex.toggle = false;
            this.btnUpDex.visible = true;
            try
            {
                this.btnUpDex["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDownDex_Scene1_button_0()
        {
            try
            {
                this.btnDownDex["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDownDex.autoRepeat = true;
            this.btnDownDex.autoSize = "none";
            this.btnDownDex.enabled = true;
            this.btnDownDex.focusable = false;
            this.btnDownDex.groupName = "";
            this.btnDownDex.label = "";
            this.btnDownDex.overlayAlign = "none";
            this.btnDownDex.overlayImg = "";
            this.btnDownDex.overlayPadding = {x:0, y:0};
            this.btnDownDex.selected = false;
            this.btnDownDex.toggle = false;
            this.btnDownDex.visible = true;
            try
            {
                this.btnDownDex["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnUpSpi_Scene1_button_0()
        {
            try
            {
                this.btnUpSpi["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUpSpi.autoRepeat = true;
            this.btnUpSpi.autoSize = "none";
            this.btnUpSpi.enabled = true;
            this.btnUpSpi.focusable = false;
            this.btnUpSpi.groupName = "";
            this.btnUpSpi.label = "";
            this.btnUpSpi.overlayAlign = "none";
            this.btnUpSpi.overlayImg = "";
            this.btnUpSpi.overlayPadding = {x:0, y:0};
            this.btnUpSpi.selected = false;
            this.btnUpSpi.toggle = false;
            this.btnUpSpi.visible = true;
            try
            {
                this.btnUpSpi["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDownSpi_Scene1_button_0()
        {
            try
            {
                this.btnDownSpi["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDownSpi.autoRepeat = true;
            this.btnDownSpi.autoSize = "none";
            this.btnDownSpi.enabled = true;
            this.btnDownSpi.focusable = false;
            this.btnDownSpi.groupName = "";
            this.btnDownSpi.label = "";
            this.btnDownSpi.overlayAlign = "none";
            this.btnDownSpi.overlayImg = "";
            this.btnDownSpi.overlayPadding = {x:0, y:0};
            this.btnDownSpi.selected = false;
            this.btnDownSpi.toggle = false;
            this.btnDownSpi.visible = true;
            try
            {
                this.btnDownSpi["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnUpStr_Scene1_button_0()
        {
            try
            {
                this.btnUpStr["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUpStr.autoRepeat = true;
            this.btnUpStr.autoSize = "none";
            this.btnUpStr.enabled = true;
            this.btnUpStr.focusable = false;
            this.btnUpStr.groupName = "";
            this.btnUpStr.label = "";
            this.btnUpStr.overlayAlign = "none";
            this.btnUpStr.overlayImg = "";
            this.btnUpStr.overlayPadding = {x:0, y:0};
            this.btnUpStr.selected = false;
            this.btnUpStr.toggle = false;
            this.btnUpStr.visible = true;
            try
            {
                this.btnUpStr["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDownStr_Scene1_button_0()
        {
            try
            {
                this.btnDownStr["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDownStr.autoRepeat = true;
            this.btnDownStr.autoSize = "none";
            this.btnDownStr.enabled = true;
            this.btnDownStr.focusable = false;
            this.btnDownStr.groupName = "";
            this.btnDownStr.label = "";
            this.btnDownStr.overlayAlign = "none";
            this.btnDownStr.overlayImg = "";
            this.btnDownStr.overlayPadding = {x:0, y:0};
            this.btnDownStr.selected = false;
            this.btnDownStr.toggle = false;
            this.btnDownStr.visible = true;
            try
            {
                this.btnDownStr["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnUpSta_Scene1_button_0()
        {
            try
            {
                this.btnUpSta["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUpSta.autoRepeat = true;
            this.btnUpSta.autoSize = "none";
            this.btnUpSta.enabled = true;
            this.btnUpSta.focusable = false;
            this.btnUpSta.groupName = "";
            this.btnUpSta.label = "";
            this.btnUpSta.overlayAlign = "none";
            this.btnUpSta.overlayImg = "";
            this.btnUpSta.overlayPadding = {x:0, y:0};
            this.btnUpSta.selected = false;
            this.btnUpSta.toggle = false;
            this.btnUpSta.visible = true;
            try
            {
                this.btnUpSta["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDownSta_Scene1_button_0()
        {
            try
            {
                this.btnDownSta["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDownSta.autoRepeat = true;
            this.btnDownSta.autoSize = "none";
            this.btnDownSta.enabled = true;
            this.btnDownSta.focusable = false;
            this.btnDownSta.groupName = "";
            this.btnDownSta.label = "";
            this.btnDownSta.overlayAlign = "none";
            this.btnDownSta.overlayImg = "";
            this.btnDownSta.overlayPadding = {x:0, y:0};
            this.btnDownSta.selected = false;
            this.btnDownSta.toggle = false;
            this.btnDownSta.visible = true;
            try
            {
                this.btnDownSta["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_infoStats_Scene1_text_0()
        {
            try
            {
                this.infoStats["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.infoStats.autoSize = "center";
            this.infoStats.autoSizeEnable = false;
            this.infoStats.enabled = true;
            this.infoStats.text = "label";
            this.infoStats.visible = true;
            try
            {
                this.infoStats["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_setStats_Scene1_text_0()
        {
            try
            {
                this.setStats["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.setStats.autoSize = "center";
            this.setStats.autoSizeEnable = false;
            this.setStats.enabled = true;
            this.setStats.text = "label";
            this.setStats.visible = true;
            try
            {
                this.setStats["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_returnSkillMoney_Scene1_text_0()
        {
            try
            {
                this.returnSkillMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.returnSkillMoney.autoSize = "left";
            this.returnSkillMoney.autoSizeEnable = false;
            this.returnSkillMoney.enabled = true;
            this.returnSkillMoney.text = "";
            this.returnSkillMoney.visible = true;
            try
            {
                this.returnSkillMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_infoPoint_Scene1_text_0()
        {
            try
            {
                this.infoPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.infoPoint.autoSize = "center";
            this.infoPoint.autoSizeEnable = false;
            this.infoPoint.enabled = true;
            this.infoPoint.text = "";
            this.infoPoint.visible = true;
            try
            {
                this.infoPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_setPoint_Scene1_text_0()
        {
            try
            {
                this.setPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.setPoint.autoSize = "center";
            this.setPoint.autoSizeEnable = false;
            this.setPoint.enabled = true;
            this.setPoint.text = "";
            this.setPoint.visible = true;
            try
            {
                this.setPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_BottomText_Scene1_text_0()
        {
            try
            {
                this.BottomText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.BottomText.defaultText = "";
            this.BottomText.displayAsPassword = false;
            this.BottomText.editable = false;
            this.BottomText.enabled = true;
            this.BottomText.focusable = false;
            this.BottomText.maxByte = 0;
            this.BottomText.maxChars = 0;
            this.BottomText.minThumbSize = 1;
            this.BottomText.OnlyNumber = false;
            this.BottomText.Restrict = "all";
            this.BottomText.RestrictAddOn = "";
            this.BottomText.scrollBar = "";
            this.BottomText.text = "";
            this.BottomText.textAlign = "left";
            this.BottomText.thumbOffset = {top:0, bottom:0};
            this.BottomText.visible = true;
            try
            {
                this.BottomText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_topText_Scene1_text_0()
        {
            try
            {
                this.topText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.topText.defaultText = "";
            this.topText.displayAsPassword = false;
            this.topText.editable = false;
            this.topText.enabled = true;
            this.topText.focusable = false;
            this.topText.maxByte = 0;
            this.topText.maxChars = 0;
            this.topText.minThumbSize = 1;
            this.topText.OnlyNumber = false;
            this.topText.Restrict = "all";
            this.topText.RestrictAddOn = "";
            this.topText.scrollBar = "";
            this.topText.text = "";
            this.topText.textAlign = "left";
            this.topText.thumbOffset = {top:0, bottom:0};
            this.topText.visible = true;
            try
            {
                this.topText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_returnSkillPoint_Scene1_text_0()
        {
            try
            {
                this.returnSkillPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.returnSkillPoint.autoSize = "left";
            this.returnSkillPoint.autoSizeEnable = false;
            this.returnSkillPoint.enabled = true;
            this.returnSkillPoint.text = "";
            this.returnSkillPoint.visible = true;
            try
            {
                this.returnSkillPoint["componentInspectorSetting"] = false;
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
