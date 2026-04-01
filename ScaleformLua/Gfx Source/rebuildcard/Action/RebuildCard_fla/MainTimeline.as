package RebuildCard_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mcStampCheck_addon:MovieClip;
        public var RebuildRangePanel:TooltipRebuild;
        public var mcStampCheck_basic_cache:MovieClip;
        public var labelTooltip_cache:TextField;
        public var mcStampCheck_cache:MovieClip;
        public var labelTooltip:TextField;
        public var Preserve_before_change:TextField;
        public var mcStampCheck_addon_cache:MovieClip;
        public var lbCache:TextField;
        public var labelCaption:TextField;
        public var mcStampCheck:MovieClip;
        public var mcStampCheck_basic:MovieClip;
        public var labelItemLink:TextField;
        public var lbCurrent:TextField;
        public var labelItemLink_cache:TextField;
        public var slotItem:Slot;
        public var slotStemp:Slot;
        public var labelMoney:Label;
        public var btnOK:Button;
        public var btnCancel:Button;
        public var btnSelectToCache:Button;
        public var cbKeepOrigin:CheckBox;
        public var btnToggleRangePanel:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnOK_Scene1_btn_0();
            this.__setProp_btnCancel_Scene1_btn_0();
            this.__setProp_btnSelectToCache_Scene1_btn_0();
            this.__setProp_btnToggleRangePanel_Scene1_btn_0();
            this.__setProp_labelMoney_Scene1_MoneyLabel_0();
            return;
        }// end function

        function __setProp_btnOK_Scene1_btn_0()
        {
            try
            {
                this.btnOK["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOK.autoRepeat = false;
            this.btnOK.autoSize = "none";
            this.btnOK.enabled = true;
            this.btnOK.focusable = false;
            this.btnOK.groupName = "";
            this.btnOK.label = "";
            this.btnOK.overlayAlign = "none";
            this.btnOK.overlayImg = "";
            this.btnOK.overlayPadding = {x:0, y:0};
            this.btnOK.selected = false;
            this.btnOK.toggle = false;
            this.btnOK.visible = true;
            try
            {
                this.btnOK["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_Scene1_btn_0()
        {
            try
            {
                this.btnCancel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCancel.autoRepeat = false;
            this.btnCancel.autoSize = "none";
            this.btnCancel.enabled = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.selected = false;
            this.btnCancel.toggle = false;
            this.btnCancel.visible = true;
            try
            {
                this.btnCancel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSelectToCache_Scene1_btn_0()
        {
            try
            {
                this.btnSelectToCache["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSelectToCache.autoRepeat = false;
            this.btnSelectToCache.autoSize = "none";
            this.btnSelectToCache.enabled = true;
            this.btnSelectToCache.focusable = false;
            this.btnSelectToCache.groupName = "";
            this.btnSelectToCache.label = "";
            this.btnSelectToCache.overlayAlign = "none";
            this.btnSelectToCache.overlayImg = "";
            this.btnSelectToCache.overlayPadding = {x:0, y:0};
            this.btnSelectToCache.selected = false;
            this.btnSelectToCache.toggle = false;
            this.btnSelectToCache.visible = true;
            try
            {
                this.btnSelectToCache["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnToggleRangePanel_Scene1_btn_0()
        {
            try
            {
                this.btnToggleRangePanel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnToggleRangePanel.autoRepeat = false;
            this.btnToggleRangePanel.autoSize = "none";
            this.btnToggleRangePanel.enabled = true;
            this.btnToggleRangePanel.focusable = false;
            this.btnToggleRangePanel.groupName = "";
            this.btnToggleRangePanel.label = "";
            this.btnToggleRangePanel.overlayAlign = "none";
            this.btnToggleRangePanel.overlayImg = "";
            this.btnToggleRangePanel.overlayPadding = {x:0, y:0};
            this.btnToggleRangePanel.selected = false;
            this.btnToggleRangePanel.toggle = false;
            this.btnToggleRangePanel.visible = true;
            try
            {
                this.btnToggleRangePanel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMoney_Scene1_MoneyLabel_0()
        {
            try
            {
                this.labelMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMoney.autoSize = "left";
            this.labelMoney.enabled = true;
            this.labelMoney.text = "";
            this.labelMoney.visible = true;
            try
            {
                this.labelMoney["componentInspectorSetting"] = false;
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
