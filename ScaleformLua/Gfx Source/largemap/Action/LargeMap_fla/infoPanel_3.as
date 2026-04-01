package LargeMap_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class infoPanel_3 extends MovieClip
    {
        public var exList:ExternalTileList;
        public var checkMobInfo:Button;
        public var checkMobList1:ListItemRenderer;
        public var checkMobList2:ListItemRenderer;
        public var checkMobList3:ListItemRenderer;
        public var checkMobList4:ListItemRenderer;
        public var checkMobList5:ListItemRenderer;
        public var checkMobList6:ListItemRenderer;
        public var checkMobList7:ListItemRenderer;
        public var checkMobList8:ListItemRenderer;
        public var listMob:ScrollingList;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var slot6:Slot;
        public var slot7:Slot;
        public var slot8:Slot;
        public var slot9:Slot;
        public var slot10:Slot;
        public var slot11:Slot;
        public var slot12:Slot;
        public var slot13:Slot;
        public var slot14:Slot;
        public var slot15:Slot;
        public var slot16:Slot;
        public var slot17:Slot;
        public var slot18:Slot;
        public var slot19:Slot;
        public var slot20:Slot;
        public var slot21:Slot;
        public var slot22:Slot;
        public var slot23:Slot;
        public var slot24:Slot;
        public var slot25:Slot;
        public var listMob_scrollbar:ScrollBar;
        public var labelItem:Label;

        public function infoPanel_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listMob_infoPanel_list_0();
            this.__setProp_labelItem_infoPanel_list_0();
            this.__setProp_listMob_scrollbar_infoPanel_list_0();
            this.__setProp_checkMobInfo_infoPanel_Button_0();
            this.__setProp_checkMobList1_infoPanel_renderer_0();
            this.__setProp_checkMobList2_infoPanel_renderer_0();
            this.__setProp_checkMobList3_infoPanel_renderer_0();
            this.__setProp_checkMobList4_infoPanel_renderer_0();
            this.__setProp_checkMobList5_infoPanel_renderer_0();
            this.__setProp_checkMobList6_infoPanel_renderer_0();
            this.__setProp_checkMobList7_infoPanel_renderer_0();
            this.__setProp_checkMobList8_infoPanel_renderer_0();
            return;
        }// end function

        function __setProp_listMob_infoPanel_list_0()
        {
            try
            {
                this.listMob["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listMob.enabled = true;
            this.listMob.focusable = false;
            this.listMob.itemRendererName = "";
            this.listMob.itemRendererInstanceName = "checkMobList";
            this.listMob.margin = 0;
            this.listMob.multiSelect = true;
            this.listMob.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listMob.rowHeight = 0;
            this.listMob.scrollBar = "";
            this.listMob.treeButtonClassName = "";
            this.listMob.treeButtonGap = -1;
            this.listMob.treeCheckBoxClassName = "";
            this.listMob.treeList = false;
            this.listMob.visible = true;
            this.listMob.wrapping = "normal";
            try
            {
                this.listMob["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelItem_infoPanel_list_0()
        {
            try
            {
                this.labelItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelItem.autoSize = "left";
            this.labelItem.enabled = true;
            this.labelItem.text = "";
            this.labelItem.visible = true;
            try
            {
                this.labelItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listMob_scrollbar_infoPanel_list_0()
        {
            try
            {
                this.listMob_scrollbar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listMob_scrollbar.enabled = true;
            this.listMob_scrollbar.minThumbSize = 10;
            this.listMob_scrollbar.offsetBottom = 0;
            this.listMob_scrollbar.offsetTop = 0;
            this.listMob_scrollbar.scrollTarget = "listMob";
            this.listMob_scrollbar.trackMode = "scrollPage";
            this.listMob_scrollbar.visible = true;
            try
            {
                this.listMob_scrollbar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobInfo_infoPanel_Button_0()
        {
            try
            {
                this.checkMobInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobInfo.autoRepeat = false;
            this.checkMobInfo.autoSize = "none";
            this.checkMobInfo.enabled = true;
            this.checkMobInfo.focusable = true;
            this.checkMobInfo.groupName = "";
            this.checkMobInfo.label = "UnCheckAll";
            this.checkMobInfo.overlayAlign = "none";
            this.checkMobInfo.overlayImg = "";
            this.checkMobInfo.overlayPadding = {x:0, y:0};
            this.checkMobInfo.preventAutoSize = false;
            this.checkMobInfo.selected = false;
            this.checkMobInfo.toggle = false;
            this.checkMobInfo.visible = true;
            try
            {
                this.checkMobInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList1_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList1.autoRepeat = false;
            this.checkMobList1.autoSize = "none";
            this.checkMobList1.enabled = true;
            this.checkMobList1.groupName = "";
            this.checkMobList1.label = "";
            this.checkMobList1.overlayAlign = "none";
            this.checkMobList1.overlayImg = "";
            this.checkMobList1.overlayPadding = {x:0, y:0};
            this.checkMobList1.preventAutoSize = false;
            this.checkMobList1.selected = false;
            this.checkMobList1.toggle = false;
            this.checkMobList1.usePrevLabel = false;
            this.checkMobList1.visible = true;
            try
            {
                this.checkMobList1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList2_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList2.autoRepeat = false;
            this.checkMobList2.autoSize = "none";
            this.checkMobList2.enabled = true;
            this.checkMobList2.groupName = "";
            this.checkMobList2.label = "";
            this.checkMobList2.overlayAlign = "none";
            this.checkMobList2.overlayImg = "";
            this.checkMobList2.overlayPadding = {x:0, y:0};
            this.checkMobList2.preventAutoSize = false;
            this.checkMobList2.selected = false;
            this.checkMobList2.toggle = false;
            this.checkMobList2.usePrevLabel = false;
            this.checkMobList2.visible = true;
            try
            {
                this.checkMobList2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList3_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList3.autoRepeat = false;
            this.checkMobList3.autoSize = "none";
            this.checkMobList3.enabled = true;
            this.checkMobList3.groupName = "";
            this.checkMobList3.label = "";
            this.checkMobList3.overlayAlign = "none";
            this.checkMobList3.overlayImg = "";
            this.checkMobList3.overlayPadding = {x:0, y:0};
            this.checkMobList3.preventAutoSize = false;
            this.checkMobList3.selected = false;
            this.checkMobList3.toggle = false;
            this.checkMobList3.usePrevLabel = false;
            this.checkMobList3.visible = true;
            try
            {
                this.checkMobList3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList4_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList4.autoRepeat = false;
            this.checkMobList4.autoSize = "none";
            this.checkMobList4.enabled = true;
            this.checkMobList4.groupName = "";
            this.checkMobList4.label = "";
            this.checkMobList4.overlayAlign = "none";
            this.checkMobList4.overlayImg = "";
            this.checkMobList4.overlayPadding = {x:0, y:0};
            this.checkMobList4.preventAutoSize = false;
            this.checkMobList4.selected = false;
            this.checkMobList4.toggle = false;
            this.checkMobList4.usePrevLabel = false;
            this.checkMobList4.visible = true;
            try
            {
                this.checkMobList4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList5_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList5.autoRepeat = false;
            this.checkMobList5.autoSize = "none";
            this.checkMobList5.enabled = true;
            this.checkMobList5.groupName = "";
            this.checkMobList5.label = "";
            this.checkMobList5.overlayAlign = "none";
            this.checkMobList5.overlayImg = "";
            this.checkMobList5.overlayPadding = {x:0, y:0};
            this.checkMobList5.preventAutoSize = false;
            this.checkMobList5.selected = false;
            this.checkMobList5.toggle = false;
            this.checkMobList5.usePrevLabel = false;
            this.checkMobList5.visible = true;
            try
            {
                this.checkMobList5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList6_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList6.autoRepeat = false;
            this.checkMobList6.autoSize = "none";
            this.checkMobList6.enabled = true;
            this.checkMobList6.groupName = "";
            this.checkMobList6.label = "";
            this.checkMobList6.overlayAlign = "none";
            this.checkMobList6.overlayImg = "";
            this.checkMobList6.overlayPadding = {x:0, y:0};
            this.checkMobList6.preventAutoSize = false;
            this.checkMobList6.selected = false;
            this.checkMobList6.toggle = false;
            this.checkMobList6.usePrevLabel = false;
            this.checkMobList6.visible = true;
            try
            {
                this.checkMobList6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList7_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList7.autoRepeat = false;
            this.checkMobList7.autoSize = "none";
            this.checkMobList7.enabled = true;
            this.checkMobList7.groupName = "";
            this.checkMobList7.label = "";
            this.checkMobList7.overlayAlign = "none";
            this.checkMobList7.overlayImg = "";
            this.checkMobList7.overlayPadding = {x:0, y:0};
            this.checkMobList7.preventAutoSize = false;
            this.checkMobList7.selected = false;
            this.checkMobList7.toggle = false;
            this.checkMobList7.usePrevLabel = false;
            this.checkMobList7.visible = true;
            try
            {
                this.checkMobList7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMobList8_infoPanel_renderer_0()
        {
            try
            {
                this.checkMobList8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMobList8.autoRepeat = false;
            this.checkMobList8.autoSize = "none";
            this.checkMobList8.enabled = true;
            this.checkMobList8.groupName = "";
            this.checkMobList8.label = "";
            this.checkMobList8.overlayAlign = "none";
            this.checkMobList8.overlayImg = "";
            this.checkMobList8.overlayPadding = {x:0, y:0};
            this.checkMobList8.preventAutoSize = false;
            this.checkMobList8.selected = false;
            this.checkMobList8.toggle = false;
            this.checkMobList8.usePrevLabel = false;
            this.checkMobList8.visible = true;
            try
            {
                this.checkMobList8["componentInspectorSetting"] = false;
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
