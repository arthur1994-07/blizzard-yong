package TaxiCard_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelMainArea:Label;
        public var labelSubArea:Label;
        public var labelMoney:Label;
        public var btnOK:Button;
        public var iconMoney:UIComponent;
        public var MapList:ScrollingList;
        public var StationList:ScrollingList;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelMainArea_Scene1_contents_0();
            this.__setProp_MapList_Scene1_contents_0();
            this.__setProp_labelSubArea_Scene1_contents_0();
            this.__setProp_StationList_Scene1_contents_0();
            this.__setProp_btnOK_Scene1_contents_0();
            this.__setProp_labelMoney_Scene1_contents_0();
            return;
        }// end function

        function __setProp_labelMainArea_Scene1_contents_0()
        {
            try
            {
                this.labelMainArea["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMainArea.autoSize = "center";
            this.labelMainArea.autoSizeEnable = false;
            this.labelMainArea.enabled = true;
            this.labelMainArea.text = "label";
            this.labelMainArea.visible = true;
            try
            {
                this.labelMainArea["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_MapList_Scene1_contents_0()
        {
            try
            {
                this.MapList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.MapList.enabled = true;
            this.MapList.focusable = true;
            this.MapList.itemRendererName = "DefaultListItemRenderer";
            this.MapList.itemRendererInstanceName = "";
            this.MapList.margin = 0;
            this.MapList.multiSelect = false;
            this.MapList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.MapList.rowHeight = 0;
            this.MapList.scrollBar = "DefaultScrollBar";
            this.MapList.treeButtonClassName = "";
            this.MapList.treeButtonGap = -1;
            this.MapList.treeCheckBoxClassName = "";
            this.MapList.treeList = false;
            this.MapList.visible = true;
            this.MapList.wrapping = "normal";
            try
            {
                this.MapList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelSubArea_Scene1_contents_0()
        {
            try
            {
                this.labelSubArea["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelSubArea.autoSize = "center";
            this.labelSubArea.autoSizeEnable = false;
            this.labelSubArea.enabled = true;
            this.labelSubArea.text = "label";
            this.labelSubArea.visible = true;
            try
            {
                this.labelSubArea["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_StationList_Scene1_contents_0()
        {
            try
            {
                this.StationList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.StationList.enabled = true;
            this.StationList.focusable = true;
            this.StationList.itemRendererName = "DefaultListItemRenderer";
            this.StationList.itemRendererInstanceName = "";
            this.StationList.margin = 0;
            this.StationList.multiSelect = false;
            this.StationList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.StationList.rowHeight = 0;
            this.StationList.scrollBar = "DefaultScrollBar";
            this.StationList.treeButtonClassName = "";
            this.StationList.treeButtonGap = -1;
            this.StationList.treeCheckBoxClassName = "";
            this.StationList.treeList = false;
            this.StationList.visible = true;
            this.StationList.wrapping = "normal";
            try
            {
                this.StationList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOK_Scene1_contents_0()
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
            this.btnOK.label = "DefautlButton";
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

        function __setProp_labelMoney_Scene1_contents_0()
        {
            try
            {
                this.labelMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMoney.autoSize = "right";
            this.labelMoney.autoSizeEnable = false;
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
