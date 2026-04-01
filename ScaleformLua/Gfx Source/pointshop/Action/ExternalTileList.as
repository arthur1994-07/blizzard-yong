package 
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.data.*;

    dynamic public class ExternalTileList extends MovieClip
    {
        public var item5:ListItemRendererPointShop;
        public var item6:ListItemRendererPointShop;
        public var item7:ListItemRendererPointShop;
        public var item10:ListItemRendererPointShop;
        public var item8:ListItemRendererPointShop;
        public var item20:ListItemRendererPointShop;
        public var item11:ListItemRendererPointShop;
        public var item9:ListItemRendererPointShop;
        public var item12:ListItemRendererPointShop;
        public var item13:ListItemRendererPointShop;
        public var item14:ListItemRendererPointShop;
        public var item15:ListItemRendererPointShop;
        public var item16:ListItemRendererPointShop;
        public var item17:ListItemRendererPointShop;
        public var item18:ListItemRendererPointShop;
        public var item19:ListItemRendererPointShop;
        public var item1:ListItemRendererPointShop;
        public var item2:ListItemRendererPointShop;
        public var item3:ListItemRendererPointShop;
        public var item4:ListItemRendererPointShop;
        public var list:TileList;
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
        public var optionStepper:OptionStepper;
        public var arr:Array;
        public var i:int;
        public var obj:Object;

        public function ExternalTileList()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_ItemList_TileList_0();
            this.__setProp_item1_ItemList_Renderers_0();
            this.__setProp_item2_ItemList_Renderers_0();
            this.__setProp_item3_ItemList_Renderers_0();
            this.__setProp_item4_ItemList_Renderers_0();
            this.__setProp_item5_ItemList_Renderers_0();
            this.__setProp_item6_ItemList_Renderers_0();
            this.__setProp_item7_ItemList_Renderers_0();
            this.__setProp_item8_ItemList_Renderers_0();
            this.__setProp_item9_ItemList_Renderers_0();
            this.__setProp_item10_ItemList_Renderers_0();
            this.__setProp_item11_ItemList_Renderers_0();
            this.__setProp_item12_ItemList_Renderers_0();
            this.__setProp_item13_ItemList_Renderers_0();
            this.__setProp_item14_ItemList_Renderers_0();
            this.__setProp_item15_ItemList_Renderers_0();
            this.__setProp_item16_ItemList_Renderers_0();
            this.__setProp_item17_ItemList_Renderers_0();
            this.__setProp_item18_ItemList_Renderers_0();
            this.__setProp_item19_ItemList_Renderers_0();
            this.__setProp_item20_ItemList_Renderers_0();
            this.__setProp_optionStepper_ItemList_Renderers_0();
            return;
        }// end function

        function __setProp_list_ItemList_TileList_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.columnWidth = 0;
            this.list.direction = "vertical";
            this.list.enabled = true;
            this.list.externalColumnCount = 2;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item1_ItemList_Renderers_0()
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
            this.item1.slotName = "slot1";
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

        function __setProp_item2_ItemList_Renderers_0()
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
            this.item2.slotName = "slot2";
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

        function __setProp_item3_ItemList_Renderers_0()
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
            this.item3.slotName = "slot3";
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

        function __setProp_item4_ItemList_Renderers_0()
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
            this.item4.slotName = "slot4";
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

        function __setProp_item5_ItemList_Renderers_0()
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
            this.item5.slotName = "slot5";
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

        function __setProp_item6_ItemList_Renderers_0()
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
            this.item6.slotName = "slot6";
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

        function __setProp_item7_ItemList_Renderers_0()
        {
            try
            {
                this.item7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item7.autoRepeat = false;
            this.item7.autoSize = "none";
            this.item7.enabled = true;
            this.item7.groupName = "";
            this.item7.label = "";
            this.item7.overlayAlign = "none";
            this.item7.overlayImg = "";
            this.item7.overlayPadding = {x:0, y:0};
            this.item7.preventAutoSize = false;
            this.item7.selected = false;
            this.item7.slotName = "slot7";
            this.item7.toggle = false;
            this.item7.usePrevLabel = false;
            this.item7.visible = true;
            try
            {
                this.item7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item8_ItemList_Renderers_0()
        {
            try
            {
                this.item8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item8.autoRepeat = false;
            this.item8.autoSize = "none";
            this.item8.enabled = true;
            this.item8.groupName = "";
            this.item8.label = "";
            this.item8.overlayAlign = "none";
            this.item8.overlayImg = "";
            this.item8.overlayPadding = {x:0, y:0};
            this.item8.preventAutoSize = false;
            this.item8.selected = false;
            this.item8.slotName = "slot8";
            this.item8.toggle = false;
            this.item8.usePrevLabel = false;
            this.item8.visible = true;
            try
            {
                this.item8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item9_ItemList_Renderers_0()
        {
            try
            {
                this.item9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item9.autoRepeat = false;
            this.item9.autoSize = "none";
            this.item9.enabled = true;
            this.item9.groupName = "";
            this.item9.label = "";
            this.item9.overlayAlign = "none";
            this.item9.overlayImg = "";
            this.item9.overlayPadding = {x:0, y:0};
            this.item9.preventAutoSize = false;
            this.item9.selected = false;
            this.item9.slotName = "slot9";
            this.item9.toggle = false;
            this.item9.usePrevLabel = false;
            this.item9.visible = true;
            try
            {
                this.item9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item10_ItemList_Renderers_0()
        {
            try
            {
                this.item10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item10.autoRepeat = false;
            this.item10.autoSize = "none";
            this.item10.enabled = true;
            this.item10.groupName = "";
            this.item10.label = "";
            this.item10.overlayAlign = "none";
            this.item10.overlayImg = "";
            this.item10.overlayPadding = {x:0, y:0};
            this.item10.preventAutoSize = false;
            this.item10.selected = false;
            this.item10.slotName = "slot10";
            this.item10.toggle = false;
            this.item10.usePrevLabel = false;
            this.item10.visible = true;
            try
            {
                this.item10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item11_ItemList_Renderers_0()
        {
            try
            {
                this.item11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item11.autoRepeat = false;
            this.item11.autoSize = "none";
            this.item11.enabled = true;
            this.item11.groupName = "";
            this.item11.label = "";
            this.item11.overlayAlign = "none";
            this.item11.overlayImg = "";
            this.item11.overlayPadding = {x:0, y:0};
            this.item11.preventAutoSize = false;
            this.item11.selected = false;
            this.item11.slotName = "slot11";
            this.item11.toggle = false;
            this.item11.usePrevLabel = false;
            this.item11.visible = true;
            try
            {
                this.item11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item12_ItemList_Renderers_0()
        {
            try
            {
                this.item12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item12.autoRepeat = false;
            this.item12.autoSize = "none";
            this.item12.enabled = true;
            this.item12.groupName = "";
            this.item12.label = "";
            this.item12.overlayAlign = "none";
            this.item12.overlayImg = "";
            this.item12.overlayPadding = {x:0, y:0};
            this.item12.preventAutoSize = false;
            this.item12.selected = false;
            this.item12.slotName = "slot12";
            this.item12.toggle = false;
            this.item12.usePrevLabel = false;
            this.item12.visible = true;
            try
            {
                this.item12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item13_ItemList_Renderers_0()
        {
            try
            {
                this.item13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item13.autoRepeat = false;
            this.item13.autoSize = "none";
            this.item13.enabled = true;
            this.item13.groupName = "";
            this.item13.label = "";
            this.item13.overlayAlign = "none";
            this.item13.overlayImg = "";
            this.item13.overlayPadding = {x:0, y:0};
            this.item13.preventAutoSize = false;
            this.item13.selected = false;
            this.item13.slotName = "slot13";
            this.item13.toggle = false;
            this.item13.usePrevLabel = false;
            this.item13.visible = true;
            try
            {
                this.item13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item14_ItemList_Renderers_0()
        {
            try
            {
                this.item14["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item14.autoRepeat = false;
            this.item14.autoSize = "none";
            this.item14.enabled = true;
            this.item14.groupName = "";
            this.item14.label = "";
            this.item14.overlayAlign = "none";
            this.item14.overlayImg = "";
            this.item14.overlayPadding = {x:0, y:0};
            this.item14.preventAutoSize = false;
            this.item14.selected = false;
            this.item14.slotName = "slot14";
            this.item14.toggle = false;
            this.item14.usePrevLabel = false;
            this.item14.visible = true;
            try
            {
                this.item14["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item15_ItemList_Renderers_0()
        {
            try
            {
                this.item15["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item15.autoRepeat = false;
            this.item15.autoSize = "none";
            this.item15.enabled = true;
            this.item15.groupName = "";
            this.item15.label = "";
            this.item15.overlayAlign = "none";
            this.item15.overlayImg = "";
            this.item15.overlayPadding = {x:0, y:0};
            this.item15.preventAutoSize = false;
            this.item15.selected = false;
            this.item15.slotName = "slot15";
            this.item15.toggle = false;
            this.item15.usePrevLabel = false;
            this.item15.visible = true;
            try
            {
                this.item15["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item16_ItemList_Renderers_0()
        {
            try
            {
                this.item16["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item16.autoRepeat = false;
            this.item16.autoSize = "none";
            this.item16.enabled = true;
            this.item16.groupName = "";
            this.item16.label = "";
            this.item16.overlayAlign = "none";
            this.item16.overlayImg = "";
            this.item16.overlayPadding = {x:0, y:0};
            this.item16.preventAutoSize = false;
            this.item16.selected = false;
            this.item16.slotName = "slot16";
            this.item16.toggle = false;
            this.item16.usePrevLabel = false;
            this.item16.visible = true;
            try
            {
                this.item16["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item17_ItemList_Renderers_0()
        {
            try
            {
                this.item17["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item17.autoRepeat = false;
            this.item17.autoSize = "none";
            this.item17.enabled = true;
            this.item17.groupName = "";
            this.item17.label = "";
            this.item17.overlayAlign = "none";
            this.item17.overlayImg = "";
            this.item17.overlayPadding = {x:0, y:0};
            this.item17.preventAutoSize = false;
            this.item17.selected = false;
            this.item17.slotName = "slot17";
            this.item17.toggle = false;
            this.item17.usePrevLabel = false;
            this.item17.visible = true;
            try
            {
                this.item17["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item18_ItemList_Renderers_0()
        {
            try
            {
                this.item18["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item18.autoRepeat = false;
            this.item18.autoSize = "none";
            this.item18.enabled = true;
            this.item18.groupName = "";
            this.item18.label = "";
            this.item18.overlayAlign = "none";
            this.item18.overlayImg = "";
            this.item18.overlayPadding = {x:0, y:0};
            this.item18.preventAutoSize = false;
            this.item18.selected = false;
            this.item18.slotName = "slot18";
            this.item18.toggle = false;
            this.item18.usePrevLabel = false;
            this.item18.visible = true;
            try
            {
                this.item18["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item19_ItemList_Renderers_0()
        {
            try
            {
                this.item19["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item19.autoRepeat = false;
            this.item19.autoSize = "none";
            this.item19.enabled = true;
            this.item19.groupName = "";
            this.item19.label = "";
            this.item19.overlayAlign = "none";
            this.item19.overlayImg = "";
            this.item19.overlayPadding = {x:0, y:0};
            this.item19.preventAutoSize = false;
            this.item19.selected = false;
            this.item19.slotName = "slot19";
            this.item19.toggle = false;
            this.item19.usePrevLabel = false;
            this.item19.visible = true;
            try
            {
                this.item19["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item20_ItemList_Renderers_0()
        {
            try
            {
                this.item20["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item20.autoRepeat = false;
            this.item20.autoSize = "none";
            this.item20.enabled = true;
            this.item20.groupName = "";
            this.item20.label = "";
            this.item20.overlayAlign = "none";
            this.item20.overlayImg = "";
            this.item20.overlayPadding = {x:0, y:0};
            this.item20.preventAutoSize = false;
            this.item20.selected = false;
            this.item20.slotName = "slot20";
            this.item20.toggle = false;
            this.item20.usePrevLabel = false;
            this.item20.visible = true;
            try
            {
                this.item20["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_optionStepper_ItemList_Renderers_0()
        {
            try
            {
                this.optionStepper["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.optionStepper.enabled = true;
            this.optionStepper.focusable = false;
            this.optionStepper.visible = true;
            try
            {
                this.optionStepper["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.arr = new Array();
            this.i = 0;
            while (this.i < 20)
            {
                
                this.obj = new Object();
                this.obj.label1 = "fdfd";
                this.obj.label2 = "" + this.i;
                this.arr.push(this.obj);
                var _loc_1:* = this;
                var _loc_2:* = this.i + 1;
                _loc_1.i = _loc_2;
            }
            this.list.dataProvider = new DataProvider(this.arr);
            return;
        }// end function

    }
}
