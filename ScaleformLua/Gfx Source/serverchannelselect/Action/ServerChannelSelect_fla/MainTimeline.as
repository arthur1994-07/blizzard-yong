package ServerChannelSelect_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var item5:ServerChannelSelectItemRenderer;
        public var item6:ServerChannelSelectItemRenderer;
        public var item1:ServerChannelSelectItemRenderer;
        public var item2:ServerChannelSelectItemRenderer;
        public var item3:ServerChannelSelectItemRenderer;
        public var item4:ServerChannelSelectItemRenderer;
        public var btnConnect:Button;
        public var listChannel:ScrollingList;
        public var listChannelScrollBar:ScrollBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listChannel_Scene1_asset_0();
            this.__setProp_btnConnect_Scene1_asset_0();
            this.__setProp_item1_Scene1_item_0();
            this.__setProp_item2_Scene1_item_0();
            this.__setProp_item3_Scene1_item_0();
            this.__setProp_item4_Scene1_item_0();
            this.__setProp_item5_Scene1_item_0();
            this.__setProp_item6_Scene1_item_0();
            return;
        }// end function

        function __setProp_listChannel_Scene1_asset_0()
        {
            try
            {
                this.listChannel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listChannel.enabled = true;
            this.listChannel.focusable = false;
            this.listChannel.itemRendererName = "";
            this.listChannel.itemRendererInstanceName = "item";
            this.listChannel.margin = 0;
            this.listChannel.multiSelect = false;
            this.listChannel.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listChannel.rowHeight = 0;
            this.listChannel.scrollBar = "listChannelScrollBar";
            this.listChannel.treeButtonClassName = "";
            this.listChannel.treeButtonGap = -1;
            this.listChannel.treeCheckBoxClassName = "";
            this.listChannel.treeList = false;
            this.listChannel.visible = true;
            this.listChannel.wrapping = "normal";
            try
            {
                this.listChannel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnConnect_Scene1_asset_0()
        {
            try
            {
                this.btnConnect["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnConnect.autoRepeat = false;
            this.btnConnect.autoSize = "none";
            this.btnConnect.enabled = true;
            this.btnConnect.focusable = false;
            this.btnConnect.groupName = "";
            this.btnConnect.label = "";
            this.btnConnect.overlayAlign = "none";
            this.btnConnect.overlayImg = "";
            this.btnConnect.overlayPadding = {x:0, y:0};
            this.btnConnect.selected = false;
            this.btnConnect.toggle = false;
            this.btnConnect.visible = true;
            try
            {
                this.btnConnect["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item1_Scene1_item_0()
        {
            try
            {
                this.item1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item1.autoRepeat = false;
            this.item1.autoSize = "none";
            this.item1.enabled = true;
            this.item1.groupName = "";
            this.item1.label = "";
            this.item1.overlayAlign = "none";
            this.item1.overlayImg = "";
            this.item1.overlayPadding = {x:0, y:0};
            this.item1.preventAutoSize = false;
            this.item1.selected = false;
            this.item1.toggle = false;
            this.item1.usePrevLabel = false;
            this.item1.visible = true;
            try
            {
                this.item1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item2_Scene1_item_0()
        {
            try
            {
                this.item2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item2.autoRepeat = false;
            this.item2.autoSize = "none";
            this.item2.enabled = true;
            this.item2.groupName = "";
            this.item2.label = "";
            this.item2.overlayAlign = "none";
            this.item2.overlayImg = "";
            this.item2.overlayPadding = {x:0, y:0};
            this.item2.preventAutoSize = false;
            this.item2.selected = false;
            this.item2.toggle = false;
            this.item2.usePrevLabel = false;
            this.item2.visible = true;
            try
            {
                this.item2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item3_Scene1_item_0()
        {
            try
            {
                this.item3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item3.autoRepeat = false;
            this.item3.autoSize = "none";
            this.item3.enabled = true;
            this.item3.groupName = "";
            this.item3.label = "";
            this.item3.overlayAlign = "none";
            this.item3.overlayImg = "";
            this.item3.overlayPadding = {x:0, y:0};
            this.item3.preventAutoSize = false;
            this.item3.selected = false;
            this.item3.toggle = false;
            this.item3.usePrevLabel = false;
            this.item3.visible = true;
            try
            {
                this.item3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item4_Scene1_item_0()
        {
            try
            {
                this.item4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item4.autoRepeat = false;
            this.item4.autoSize = "none";
            this.item4.enabled = true;
            this.item4.groupName = "";
            this.item4.label = "";
            this.item4.overlayAlign = "none";
            this.item4.overlayImg = "";
            this.item4.overlayPadding = {x:0, y:0};
            this.item4.preventAutoSize = false;
            this.item4.selected = false;
            this.item4.toggle = false;
            this.item4.usePrevLabel = false;
            this.item4.visible = true;
            try
            {
                this.item4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item5_Scene1_item_0()
        {
            try
            {
                this.item5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item5.autoRepeat = false;
            this.item5.autoSize = "none";
            this.item5.enabled = true;
            this.item5.groupName = "";
            this.item5.label = "";
            this.item5.overlayAlign = "none";
            this.item5.overlayImg = "";
            this.item5.overlayPadding = {x:0, y:0};
            this.item5.preventAutoSize = false;
            this.item5.selected = false;
            this.item5.toggle = false;
            this.item5.usePrevLabel = false;
            this.item5.visible = true;
            try
            {
                this.item5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item6_Scene1_item_0()
        {
            try
            {
                this.item6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item6.autoRepeat = false;
            this.item6.autoSize = "none";
            this.item6.enabled = true;
            this.item6.groupName = "";
            this.item6.label = "";
            this.item6.overlayAlign = "none";
            this.item6.overlayImg = "";
            this.item6.overlayPadding = {x:0, y:0};
            this.item6.preventAutoSize = false;
            this.item6.selected = false;
            this.item6.toggle = false;
            this.item6.usePrevLabel = false;
            this.item6.visible = true;
            try
            {
                this.item6["componentInspectorSetting"] = false;
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
