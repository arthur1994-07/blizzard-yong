package MultiGate_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcGate_1 extends MovieClip
    {
        public var labelTip:Label;
        public var btnOK:Button;
        public var MapName1:ListItemRenderer;
        public var MapName2:ListItemRenderer;
        public var MapName3:ListItemRenderer;
        public var MapName4:ListItemRenderer;
        public var listMapName:ScrollingList;
        public var listMapScrollbar:ScrollBar;

        public function mcGate_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnOK_mcGate_btn_0();
            this.__setProp_labelTip_mcGate_label_0();
            this.__setProp_listMapName_mcGate_list_0();
            this.__setProp_listMapScrollbar_mcGate_list_0();
            return;
        }// end function

        function __setProp_btnOK_mcGate_btn_0()
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
            this.btnOK.preventAutoSize = true;
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

        function __setProp_labelTip_mcGate_label_0()
        {
            try
            {
                this.labelTip["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTip.autoSize = "center";
            this.labelTip.enabled = true;
            this.labelTip.text = "";
            this.labelTip.visible = true;
            try
            {
                this.labelTip["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listMapName_mcGate_list_0()
        {
            try
            {
                this.listMapName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listMapName.enabled = true;
            this.listMapName.focusable = true;
            this.listMapName.itemRendererName = "";
            this.listMapName.itemRendererInstanceName = "MapName";
            this.listMapName.margin = 0;
            this.listMapName.multiSelect = false;
            this.listMapName.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listMapName.rowHeight = 0;
            this.listMapName.scrollBar = "";
            this.listMapName.treeButtonClassName = "";
            this.listMapName.treeButtonGap = -1;
            this.listMapName.treeCheckBoxClassName = "";
            this.listMapName.treeList = false;
            this.listMapName.visible = true;
            this.listMapName.wrapping = "normal";
            try
            {
                this.listMapName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listMapScrollbar_mcGate_list_0()
        {
            try
            {
                this.listMapScrollbar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listMapScrollbar.enabled = true;
            this.listMapScrollbar.minThumbSize = 10;
            this.listMapScrollbar.offsetBottom = 0;
            this.listMapScrollbar.offsetTop = 0;
            this.listMapScrollbar.scrollTarget = "listMapName";
            this.listMapScrollbar.trackMode = "scrollPage";
            this.listMapScrollbar.visible = true;
            try
            {
                this.listMapScrollbar["componentInspectorSetting"] = false;
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
