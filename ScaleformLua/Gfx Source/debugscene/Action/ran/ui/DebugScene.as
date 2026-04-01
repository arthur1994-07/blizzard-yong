package ran.ui
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;

    public class DebugScene extends MovieClip
    {
        public var check0:CheckBox;
        public var check1:CheckBox;
        public var check2:CheckBox;
        public var check3:CheckBox;
        public var check4:CheckBox;
        public var check5:CheckBox;
        public var check6:CheckBox;
        public var check7:CheckBox;
        public var check8:CheckBox;
        public var check9:CheckBox;
        public var check10:CheckBox;
        public var check11:CheckBox;
        public var check12:CheckBox;
        public var check13:CheckBox;
        public var check14:CheckBox;
        public var check15:CheckBox;
        public var check16:CheckBox;
        public var check17:CheckBox;
        public var check18:CheckBox;
        public var check19:CheckBox;
        public var check20:CheckBox;
        public var check21:CheckBox;
        public var check22:CheckBox;
        public var check23:CheckBox;
        public var check24:CheckBox;
        public var check25:CheckBox;
        public var check26:CheckBox;
        public var check27:CheckBox;
        public var check28:CheckBox;
        public var check29:CheckBox;
        public var check30:CheckBox;
        public var mcCanvas:MovieClip;
        public var comboSwf:DropdownMenu;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;
        public var labelInst:Label;
        public var labelClass:Label;
        public var btnCopy:Button;
        public var mcHighlight:MovieClip;
        public var mcClassBG:MovieClip;
        public var mcInstBG:MovieClip;
        public var mcBG:MovieClip;
        public var inputSearch:TextInput;
        protected var arrCheck:Array;
        protected var arrPathName:Array;
        protected var widget:MovieClip = null;
        static const CheckCount:int = 31;

        public function DebugScene()
        {
            addFrameScript(0, this.frame1);
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            addEventListener(Event.ENTER_FRAME, this.ConfigUI, false, 0, true);
            stage.addEventListener(Event.RESIZE, this.onResolution, false, 0, true);
            stage.addEventListener(KeyboardEvent.KEY_UP, this.onToggleScene, false, 0, true);
            this.arrCheck = new Array();
            this.arrPathName = new Array();
            this.mcHighlight.visible = false;
            this.__setProp_check1_Scene1_asset_0();
            this.__setProp_check2_Scene1_asset_0();
            this.__setProp_check3_Scene1_asset_0();
            this.__setProp_check4_Scene1_asset_0();
            this.__setProp_check5_Scene1_asset_0();
            this.__setProp_check6_Scene1_asset_0();
            this.__setProp_check7_Scene1_asset_0();
            this.__setProp_check8_Scene1_asset_0();
            this.__setProp_check9_Scene1_asset_0();
            this.__setProp_check10_Scene1_asset_0();
            this.__setProp_check11_Scene1_asset_0();
            this.__setProp_check12_Scene1_asset_0();
            this.__setProp_check13_Scene1_asset_0();
            this.__setProp_check14_Scene1_asset_0();
            this.__setProp_check15_Scene1_asset_0();
            this.__setProp_check16_Scene1_asset_0();
            this.__setProp_check17_Scene1_asset_0();
            this.__setProp_check18_Scene1_asset_0();
            this.__setProp_check19_Scene1_asset_0();
            this.__setProp_check20_Scene1_asset_0();
            this.__setProp_check21_Scene1_asset_0();
            this.__setProp_check22_Scene1_asset_0();
            this.__setProp_check23_Scene1_asset_0();
            this.__setProp_check24_Scene1_asset_0();
            this.__setProp_check25_Scene1_asset_0();
            this.__setProp_check26_Scene1_asset_0();
            this.__setProp_check27_Scene1_asset_0();
            this.__setProp_check28_Scene1_asset_0();
            this.__setProp_check29_Scene1_asset_0();
            this.__setProp_check30_Scene1_asset_0();
            this.__setProp_check0_Scene1_asset_0();
            this.__setProp_list_Scene1_asset_0();
            this.__setProp_comboSwf_Scene1_asset_0();
            this.__setProp_scrollBar_Scene1_asset_0();
            this.__setProp_btnCopy_Scene1_asset_0();
            this.__setProp_labelInst_Scene1_asset_0();
            this.__setProp_labelClass_Scene1_asset_0();
            return;
        }// end function

        protected function ConfigUI(event:Event) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            removeEventListener(Event.ENTER_FRAME, this.ConfigUI);
            this.comboSwf.addEventListener(ListEvent.INDEX_CHANGE, this.onSwfSelect, false, 0, true);
            this.list.addEventListener(ListEvent.ITEM_CLICK, this.onInstSelect, false, 0, true);
            this.list.addEventListener(ScrollEvent.SCROLL_EVENT, this.onListScroll, false, 0, true);
            this.list.addEventListener(TreeEvent.ITEM_COLLAPSE, this.onListCollapse, false, 0, true);
            this.list.addEventListener(TreeEvent.ITEM_EXPAND, this.onListCollapse, false, 0, true);
            this.btnCopy.addEventListener(ButtonEvent.CLICK, this.onPasteClick, false, 0, true);
            this.inputSearch.addEventListener(KeyboardEvent.KEY_UP, this.onSearchKeyDown, false, 0, true);
            this.inputSearch.defaultText = "인스턴스 검색";
            this.list.itemClickExpand = false;
            var _loc_2:* = 0;
            while (_loc_2 < CheckCount)
            {
                
                _loc_3 = "check" + _loc_2;
                _loc_4 = this[_loc_3] as CheckBox;
                if (_loc_4 != null)
                {
                    this.arrCheck.push(_loc_4);
                    _loc_5 = new Object();
                    _loc_5.index = _loc_2;
                    _loc_4.visible = false;
                    _loc_4.data = _loc_5;
                    _loc_4.addEventListener(ButtonEvent.CLICK, this.onVisibleCheck, false, 0, true);
                }
                _loc_2++;
            }
            this.onResolution(null);
            ExternalInterface.call("onDebugSceneComplete");
            return;
        }// end function

        protected function onResolution(event:Event) : void
        {
            this.mcBG.width = stage.stageWidth;
            this.mcBG.height = stage.stageHeight;
            this.mcInstBG.y = stage.stageHeight - this.mcInstBG.height;
            this.labelInst.y = this.mcInstBG.y + 8;
            this.mcClassBG.y = this.mcInstBG.y - this.mcClassBG.height;
            this.labelClass.y = this.mcClassBG.y + 8;
            this.btnCopy.y = stage.stageHeight - this.btnCopy.height;
            this.comboSwf.x = stage.stageWidth - this.comboSwf.width;
            this.inputSearch.x = this.comboSwf.x - this.inputSearch.width;
            this.list.x = this.comboSwf.x;
            this.scrollBar.x = stage.stageWidth - this.scrollBar.width;
            var _loc_2:* = 0;
            while (_loc_2 < this.arrCheck.length)
            {
                
                this.arrCheck[_loc_2].x = this.list.x - this.arrCheck[_loc_2].width - 1;
                _loc_2++;
            }
            return;
        }// end function

        protected function onToggleScene(event:KeyboardEvent) : void
        {
            if (event.keyCode == Keyboard.F5)
            {
                ExternalInterface.call("onToggleDebugScene");
            }
            return;
        }// end function

        protected function GenerateTree() : void
        {
            this.list.dataProvider = this.GenerateLeaf(this.widget, -1, null);
            return;
        }// end function

        protected function GenerateLeaf(param1:MovieClip, param2:int, param3:Object) : DataProvider
        {
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_4:* = new DataProvider();
            var _loc_5:* = 0;
            while (_loc_5 < param1.numChildren)
            {
                
                _loc_6 = param1.getChildAt(_loc_5) as MovieClip;
                _loc_7 = param1.getChildAt(_loc_5) as TextField;
                _loc_8 = null;
                _loc_9 = "";
                if (_loc_6 != null && _loc_7 == null)
                {
                    _loc_8 = _loc_6;
                    _loc_9 = _loc_6.name;
                }
                else if (_loc_7 != null)
                {
                    _loc_8 = _loc_7;
                    _loc_9 = _loc_7.name;
                }
                else
                {
                    ;
                }
                _loc_10 = new Object();
                _loc_10.label = _loc_9;
                _loc_10.depth = param2 + 1;
                _loc_10.likeFolder = false;
                _loc_10.parent = param3;
                _loc_10.inst = _loc_8;
                if (_loc_6 != null && _loc_6.numChildren > 0)
                {
                    _loc_10.leaf = this.GenerateLeaf(_loc_6, _loc_10.depth, _loc_10);
                }
                else
                {
                    _loc_10.leaf = [];
                }
                _loc_4.push(_loc_10);
                _loc_5++;
            }
            return _loc_4;
        }// end function

        public function CF_RegUI(param1:String, param2:String) : void
        {
            var _loc_3:* = new Object();
            _loc_3.label = param1;
            _loc_3.path = param2;
            this.arrPathName.push(_loc_3);
            return;
        }// end function

        public function CF_EndRegUI() : void
        {
            this.arrPathName.sortOn("label");
            this.comboSwf.dataProvider = new DataProvider(this.arrPathName);
            return;
        }// end function

        protected function onSwfSelect(event:ListEvent) : void
        {
            var _loc_2:* = this.comboSwf.dataProvider[event.index];
            var _loc_3:* = new Loader();
            var _loc_4:* = new URLRequest(_loc_2.path);
            var _loc_5:* = new LoaderContext(false, null);
            _loc_3.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onSwfLoadComplete, false, 0, true);
            _loc_3.load(_loc_4, _loc_5);
            return;
        }// end function

        protected function onSwfLoadComplete(event:Event) : void
        {
            if (this.widget != null)
            {
                this.mcCanvas.removeChild(this.widget);
                this.widget = null;
            }
            var _loc_2:* = event.target.loader;
            this.widget = _loc_2.content as MovieClip;
            this.mcCanvas.addChild(this.widget);
            this.GenerateTree();
            this.mcHighlight.visible = false;
            this.onListScroll(null);
            return;
        }// end function

        protected function onInstSelect(event:ListEvent) : void
        {
            var _loc_2:* = new Array();
            var _loc_3:* = "";
            var _loc_4:* = this.list.dataProvider[event.index];
            while (true)
            {
                
                if (_loc_4 == null)
                {
                    break;
                }
                if (_loc_3 == "")
                {
                    _loc_3 = _loc_4.label;
                }
                else
                {
                    _loc_3 = _loc_4.label + "." + _loc_3;
                }
                _loc_2.push(_loc_4.label);
                _loc_4 = _loc_4.parent;
            }
            this.labelInst.text = _loc_3;
            _loc_2 = _loc_2.reverse();
            this.mcHighlight.x = 0;
            this.mcHighlight.y = 0;
            this.mcHighlight.scaleX = 1;
            this.mcHighlight.scaleY = 1;
            var _loc_5:* = this.widget as DisplayObject;
            var _loc_6:* = 0;
            while (_loc_6 < _loc_2.length)
            {
                
                _loc_5 = _loc_5[_loc_2[_loc_6]];
                if (_loc_5 == null)
                {
                    break;
                }
                this.mcHighlight.x = this.mcHighlight.x + _loc_5.x;
                this.mcHighlight.y = this.mcHighlight.y + _loc_5.y;
                this.mcHighlight.scaleX = this.mcHighlight.scaleX * _loc_5.scaleX;
                this.mcHighlight.scaleY = this.mcHighlight.scaleY * _loc_5.scaleY;
                _loc_6++;
            }
            if (_loc_5 == null)
            {
                this.mcHighlight.visible = false;
                this.labelInst.text = "null";
                this.labelClass.text = "null";
                return;
            }
            this.mcHighlight.width = _loc_5.width;
            this.mcHighlight.height = _loc_5.height;
            this.mcHighlight.visible = true;
            if (_loc_5 is UIComponent)
            {
                this.labelClass.text = (_loc_5 as UIComponent).toString();
            }
            else if (_loc_5 is TextField)
            {
                this.labelClass.text = "TextField";
            }
            else if (_loc_5 is MovieClip)
            {
                this.labelClass.text = "MovieClip";
            }
            return;
        }// end function

        protected function onListScroll(event:ScrollEvent) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_2:* = 0;
            while (_loc_2 < this.arrCheck.length)
            {
                
                _loc_3 = this.arrCheck[_loc_2];
                _loc_4 = this.list.scrollPosition + _loc_2;
                if (this.list.dataProvider[_loc_4] == null)
                {
                    _loc_3.visible = false;
                }
                else
                {
                    _loc_3.visible = true;
                    _loc_3.selected = this.list.dataProvider[_loc_4].inst.visible;
                    _loc_5 = this.list.dataProvider[_loc_4].parent;
                    if (_loc_5 == null)
                    {
                        _loc_3.enabled = true;
                    }
                    else
                    {
                        while (true)
                        {
                            
                            if (_loc_5 == null)
                            {
                                break;
                            }
                            _loc_3.enabled = _loc_5.inst.visible;
                            if (_loc_3.enabled == false)
                            {
                                break;
                            }
                            _loc_5 = _loc_5.parent;
                        }
                    }
                }
                _loc_2++;
            }
            return;
        }// end function

        protected function onListCollapse(event:TreeEvent) : void
        {
            this.onListScroll(null);
            return;
        }// end function

        protected function onVisibleCheck(event:ButtonEvent) : void
        {
            var _loc_2:* = event.target as CheckBox;
            var _loc_3:* = this.list.scrollPosition + _loc_2.data.index;
            this.list.dataProvider[_loc_3].inst.visible = _loc_2.selected;
            this.onListScroll(null);
            return;
        }// end function

        protected function onPasteClick(event:ButtonEvent) : void
        {
            ExternalInterface.call("onTextCopy", this.labelInst.text);
            return;
        }// end function

        protected function onSearchKeyDown(event:KeyboardEvent) : void
        {
            var _loc_5:* = 0;
            var _loc_6:* = null;
            if (Keyboard.ENTER != event.keyCode)
            {
                return;
            }
            var _loc_2:* = -1;
            var _loc_3:* = 0;
            var _loc_4:* = this.inputSearch.text.split(".");
            _loc_3 = 0;
            while (_loc_3 < _loc_4.length)
            {
                
                if (_loc_4[_loc_3].length == 0)
                {
                    _loc_4.splice(_loc_3, 1);
                }
                _loc_3++;
            }
            _loc_3 = 0;
            while (_loc_3 < _loc_4.length)
            {
                
                _loc_5 = 0;
                while (_loc_5 < this.list.dataProvider.length)
                {
                    
                    _loc_6 = this.list.dataProvider[_loc_5];
                    if (_loc_4[_loc_3] == _loc_6.label)
                    {
                        if (_loc_3 != (_loc_4.length - 1))
                        {
                            this.list.DoExpand(_loc_5, true);
                        }
                        else
                        {
                            _loc_2 = _loc_5;
                        }
                        break;
                    }
                    _loc_5++;
                }
                _loc_3++;
            }
            if (_loc_2 == -1)
            {
                trace("DebugScene Error - can not search. it has no instance.");
                return;
            }
            this.list.selectedIndex = _loc_2;
            this.onInstSelect(new ListEvent(ListEvent.ITEM_CLICK, false, true, _loc_2));
            return;
        }// end function

        private function test() : void
        {
            this.CF_RegUI("Club", "C:/SVN_Ran/patch/scaleform/Flash/Club.swf");
            this.CF_RegUI("BasicChatOption", "C:/SVN_Ran/patch/scaleform/Flash/BasicChatOption.swf");
            this.CF_RegUI("BasicChat", "C:/SVN_Ran/patch/scaleform/Flash/BasicChat.swf");
            this.CF_RegUI("BasicInfo", "C:/SVN_Ran/patch/scaleform/Flash/BasicInfo.swf");
            this.CF_RegUI("Inventory", "C:/SVN_Ran/patch/scaleform/Flash/Inventory.swf");
            this.CF_RegUI("ActivitySalesItem", "C:/SVN_Ran/patch/scaleform/Flash/ActivitySalesItem.swf");
            this.CF_EndRegUI();
            return;
        }// end function

        function __setProp_check1_Scene1_asset_0()
        {
            try
            {
                this.check1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check1.autoSize = "none";
            this.check1.enabled = true;
            this.check1.focusable = false;
            this.check1.groupName = "";
            this.check1.label = "";
            this.check1.overlayAlign = "none";
            this.check1.overlayImg = "";
            this.check1.overlayPadding = {x:0, y:0};
            this.check1.preventAutoSize = false;
            this.check1.selected = false;
            this.check1.visible = true;
            try
            {
                this.check1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check2_Scene1_asset_0()
        {
            try
            {
                this.check2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check2.autoSize = "none";
            this.check2.enabled = true;
            this.check2.focusable = false;
            this.check2.groupName = "";
            this.check2.label = "";
            this.check2.overlayAlign = "none";
            this.check2.overlayImg = "";
            this.check2.overlayPadding = {x:0, y:0};
            this.check2.preventAutoSize = false;
            this.check2.selected = false;
            this.check2.visible = true;
            try
            {
                this.check2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check3_Scene1_asset_0()
        {
            try
            {
                this.check3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check3.autoSize = "none";
            this.check3.enabled = true;
            this.check3.focusable = false;
            this.check3.groupName = "";
            this.check3.label = "";
            this.check3.overlayAlign = "none";
            this.check3.overlayImg = "";
            this.check3.overlayPadding = {x:0, y:0};
            this.check3.preventAutoSize = false;
            this.check3.selected = false;
            this.check3.visible = true;
            try
            {
                this.check3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check4_Scene1_asset_0()
        {
            try
            {
                this.check4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check4.autoSize = "none";
            this.check4.enabled = true;
            this.check4.focusable = false;
            this.check4.groupName = "";
            this.check4.label = "";
            this.check4.overlayAlign = "none";
            this.check4.overlayImg = "";
            this.check4.overlayPadding = {x:0, y:0};
            this.check4.preventAutoSize = false;
            this.check4.selected = false;
            this.check4.visible = true;
            try
            {
                this.check4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check5_Scene1_asset_0()
        {
            try
            {
                this.check5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check5.autoSize = "none";
            this.check5.enabled = true;
            this.check5.focusable = false;
            this.check5.groupName = "";
            this.check5.label = "";
            this.check5.overlayAlign = "none";
            this.check5.overlayImg = "";
            this.check5.overlayPadding = {x:0, y:0};
            this.check5.preventAutoSize = false;
            this.check5.selected = false;
            this.check5.visible = true;
            try
            {
                this.check5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check6_Scene1_asset_0()
        {
            try
            {
                this.check6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check6.autoSize = "none";
            this.check6.enabled = true;
            this.check6.focusable = false;
            this.check6.groupName = "";
            this.check6.label = "";
            this.check6.overlayAlign = "none";
            this.check6.overlayImg = "";
            this.check6.overlayPadding = {x:0, y:0};
            this.check6.preventAutoSize = false;
            this.check6.selected = false;
            this.check6.visible = true;
            try
            {
                this.check6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check7_Scene1_asset_0()
        {
            try
            {
                this.check7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check7.autoSize = "none";
            this.check7.enabled = true;
            this.check7.focusable = false;
            this.check7.groupName = "";
            this.check7.label = "";
            this.check7.overlayAlign = "none";
            this.check7.overlayImg = "";
            this.check7.overlayPadding = {x:0, y:0};
            this.check7.preventAutoSize = false;
            this.check7.selected = false;
            this.check7.visible = true;
            try
            {
                this.check7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check8_Scene1_asset_0()
        {
            try
            {
                this.check8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check8.autoSize = "none";
            this.check8.enabled = true;
            this.check8.focusable = false;
            this.check8.groupName = "";
            this.check8.label = "";
            this.check8.overlayAlign = "none";
            this.check8.overlayImg = "";
            this.check8.overlayPadding = {x:0, y:0};
            this.check8.preventAutoSize = false;
            this.check8.selected = false;
            this.check8.visible = true;
            try
            {
                this.check8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check9_Scene1_asset_0()
        {
            try
            {
                this.check9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check9.autoSize = "none";
            this.check9.enabled = true;
            this.check9.focusable = false;
            this.check9.groupName = "";
            this.check9.label = "";
            this.check9.overlayAlign = "none";
            this.check9.overlayImg = "";
            this.check9.overlayPadding = {x:0, y:0};
            this.check9.preventAutoSize = false;
            this.check9.selected = false;
            this.check9.visible = true;
            try
            {
                this.check9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check10_Scene1_asset_0()
        {
            try
            {
                this.check10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check10.autoSize = "none";
            this.check10.enabled = true;
            this.check10.focusable = false;
            this.check10.groupName = "";
            this.check10.label = "";
            this.check10.overlayAlign = "none";
            this.check10.overlayImg = "";
            this.check10.overlayPadding = {x:0, y:0};
            this.check10.preventAutoSize = false;
            this.check10.selected = false;
            this.check10.visible = true;
            try
            {
                this.check10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check11_Scene1_asset_0()
        {
            try
            {
                this.check11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check11.autoSize = "none";
            this.check11.enabled = true;
            this.check11.focusable = false;
            this.check11.groupName = "";
            this.check11.label = "";
            this.check11.overlayAlign = "none";
            this.check11.overlayImg = "";
            this.check11.overlayPadding = {x:0, y:0};
            this.check11.preventAutoSize = false;
            this.check11.selected = false;
            this.check11.visible = true;
            try
            {
                this.check11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check12_Scene1_asset_0()
        {
            try
            {
                this.check12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check12.autoSize = "none";
            this.check12.enabled = true;
            this.check12.focusable = false;
            this.check12.groupName = "";
            this.check12.label = "";
            this.check12.overlayAlign = "none";
            this.check12.overlayImg = "";
            this.check12.overlayPadding = {x:0, y:0};
            this.check12.preventAutoSize = false;
            this.check12.selected = false;
            this.check12.visible = true;
            try
            {
                this.check12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check13_Scene1_asset_0()
        {
            try
            {
                this.check13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check13.autoSize = "none";
            this.check13.enabled = true;
            this.check13.focusable = false;
            this.check13.groupName = "";
            this.check13.label = "";
            this.check13.overlayAlign = "none";
            this.check13.overlayImg = "";
            this.check13.overlayPadding = {x:0, y:0};
            this.check13.preventAutoSize = false;
            this.check13.selected = false;
            this.check13.visible = true;
            try
            {
                this.check13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check14_Scene1_asset_0()
        {
            try
            {
                this.check14["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check14.autoSize = "none";
            this.check14.enabled = true;
            this.check14.focusable = false;
            this.check14.groupName = "";
            this.check14.label = "";
            this.check14.overlayAlign = "none";
            this.check14.overlayImg = "";
            this.check14.overlayPadding = {x:0, y:0};
            this.check14.preventAutoSize = false;
            this.check14.selected = false;
            this.check14.visible = true;
            try
            {
                this.check14["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check15_Scene1_asset_0()
        {
            try
            {
                this.check15["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check15.autoSize = "none";
            this.check15.enabled = true;
            this.check15.focusable = false;
            this.check15.groupName = "";
            this.check15.label = "";
            this.check15.overlayAlign = "none";
            this.check15.overlayImg = "";
            this.check15.overlayPadding = {x:0, y:0};
            this.check15.preventAutoSize = false;
            this.check15.selected = false;
            this.check15.visible = true;
            try
            {
                this.check15["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check16_Scene1_asset_0()
        {
            try
            {
                this.check16["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check16.autoSize = "none";
            this.check16.enabled = true;
            this.check16.focusable = false;
            this.check16.groupName = "";
            this.check16.label = "";
            this.check16.overlayAlign = "none";
            this.check16.overlayImg = "";
            this.check16.overlayPadding = {x:0, y:0};
            this.check16.preventAutoSize = false;
            this.check16.selected = false;
            this.check16.visible = true;
            try
            {
                this.check16["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check17_Scene1_asset_0()
        {
            try
            {
                this.check17["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check17.autoSize = "none";
            this.check17.enabled = true;
            this.check17.focusable = false;
            this.check17.groupName = "";
            this.check17.label = "";
            this.check17.overlayAlign = "none";
            this.check17.overlayImg = "";
            this.check17.overlayPadding = {x:0, y:0};
            this.check17.preventAutoSize = false;
            this.check17.selected = false;
            this.check17.visible = true;
            try
            {
                this.check17["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check18_Scene1_asset_0()
        {
            try
            {
                this.check18["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check18.autoSize = "none";
            this.check18.enabled = true;
            this.check18.focusable = false;
            this.check18.groupName = "";
            this.check18.label = "";
            this.check18.overlayAlign = "none";
            this.check18.overlayImg = "";
            this.check18.overlayPadding = {x:0, y:0};
            this.check18.preventAutoSize = false;
            this.check18.selected = false;
            this.check18.visible = true;
            try
            {
                this.check18["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check19_Scene1_asset_0()
        {
            try
            {
                this.check19["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check19.autoSize = "none";
            this.check19.enabled = true;
            this.check19.focusable = false;
            this.check19.groupName = "";
            this.check19.label = "";
            this.check19.overlayAlign = "none";
            this.check19.overlayImg = "";
            this.check19.overlayPadding = {x:0, y:0};
            this.check19.preventAutoSize = false;
            this.check19.selected = false;
            this.check19.visible = true;
            try
            {
                this.check19["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check20_Scene1_asset_0()
        {
            try
            {
                this.check20["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check20.autoSize = "none";
            this.check20.enabled = true;
            this.check20.focusable = false;
            this.check20.groupName = "";
            this.check20.label = "";
            this.check20.overlayAlign = "none";
            this.check20.overlayImg = "";
            this.check20.overlayPadding = {x:0, y:0};
            this.check20.preventAutoSize = false;
            this.check20.selected = false;
            this.check20.visible = true;
            try
            {
                this.check20["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check21_Scene1_asset_0()
        {
            try
            {
                this.check21["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check21.autoSize = "none";
            this.check21.enabled = true;
            this.check21.focusable = false;
            this.check21.groupName = "";
            this.check21.label = "";
            this.check21.overlayAlign = "none";
            this.check21.overlayImg = "";
            this.check21.overlayPadding = {x:0, y:0};
            this.check21.preventAutoSize = false;
            this.check21.selected = false;
            this.check21.visible = true;
            try
            {
                this.check21["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check22_Scene1_asset_0()
        {
            try
            {
                this.check22["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check22.autoSize = "none";
            this.check22.enabled = true;
            this.check22.focusable = false;
            this.check22.groupName = "";
            this.check22.label = "";
            this.check22.overlayAlign = "none";
            this.check22.overlayImg = "";
            this.check22.overlayPadding = {x:0, y:0};
            this.check22.preventAutoSize = false;
            this.check22.selected = false;
            this.check22.visible = true;
            try
            {
                this.check22["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check23_Scene1_asset_0()
        {
            try
            {
                this.check23["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check23.autoSize = "none";
            this.check23.enabled = true;
            this.check23.focusable = false;
            this.check23.groupName = "";
            this.check23.label = "";
            this.check23.overlayAlign = "none";
            this.check23.overlayImg = "";
            this.check23.overlayPadding = {x:0, y:0};
            this.check23.preventAutoSize = false;
            this.check23.selected = false;
            this.check23.visible = true;
            try
            {
                this.check23["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check24_Scene1_asset_0()
        {
            try
            {
                this.check24["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check24.autoSize = "none";
            this.check24.enabled = true;
            this.check24.focusable = false;
            this.check24.groupName = "";
            this.check24.label = "";
            this.check24.overlayAlign = "none";
            this.check24.overlayImg = "";
            this.check24.overlayPadding = {x:0, y:0};
            this.check24.preventAutoSize = false;
            this.check24.selected = false;
            this.check24.visible = true;
            try
            {
                this.check24["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check25_Scene1_asset_0()
        {
            try
            {
                this.check25["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check25.autoSize = "none";
            this.check25.enabled = true;
            this.check25.focusable = false;
            this.check25.groupName = "";
            this.check25.label = "";
            this.check25.overlayAlign = "none";
            this.check25.overlayImg = "";
            this.check25.overlayPadding = {x:0, y:0};
            this.check25.preventAutoSize = false;
            this.check25.selected = false;
            this.check25.visible = true;
            try
            {
                this.check25["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check26_Scene1_asset_0()
        {
            try
            {
                this.check26["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check26.autoSize = "none";
            this.check26.enabled = true;
            this.check26.focusable = false;
            this.check26.groupName = "";
            this.check26.label = "";
            this.check26.overlayAlign = "none";
            this.check26.overlayImg = "";
            this.check26.overlayPadding = {x:0, y:0};
            this.check26.preventAutoSize = false;
            this.check26.selected = false;
            this.check26.visible = true;
            try
            {
                this.check26["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check27_Scene1_asset_0()
        {
            try
            {
                this.check27["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check27.autoSize = "none";
            this.check27.enabled = true;
            this.check27.focusable = false;
            this.check27.groupName = "";
            this.check27.label = "";
            this.check27.overlayAlign = "none";
            this.check27.overlayImg = "";
            this.check27.overlayPadding = {x:0, y:0};
            this.check27.preventAutoSize = false;
            this.check27.selected = false;
            this.check27.visible = true;
            try
            {
                this.check27["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check28_Scene1_asset_0()
        {
            try
            {
                this.check28["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check28.autoSize = "none";
            this.check28.enabled = true;
            this.check28.focusable = false;
            this.check28.groupName = "";
            this.check28.label = "";
            this.check28.overlayAlign = "none";
            this.check28.overlayImg = "";
            this.check28.overlayPadding = {x:0, y:0};
            this.check28.preventAutoSize = false;
            this.check28.selected = false;
            this.check28.visible = true;
            try
            {
                this.check28["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check29_Scene1_asset_0()
        {
            try
            {
                this.check29["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check29.autoSize = "none";
            this.check29.enabled = true;
            this.check29.focusable = false;
            this.check29.groupName = "";
            this.check29.label = "";
            this.check29.overlayAlign = "none";
            this.check29.overlayImg = "";
            this.check29.overlayPadding = {x:0, y:0};
            this.check29.preventAutoSize = false;
            this.check29.selected = false;
            this.check29.visible = true;
            try
            {
                this.check29["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check30_Scene1_asset_0()
        {
            try
            {
                this.check30["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check30.autoSize = "none";
            this.check30.enabled = true;
            this.check30.focusable = false;
            this.check30.groupName = "";
            this.check30.label = "";
            this.check30.overlayAlign = "none";
            this.check30.overlayImg = "";
            this.check30.overlayPadding = {x:0, y:0};
            this.check30.preventAutoSize = false;
            this.check30.selected = false;
            this.check30.visible = true;
            try
            {
                this.check30["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_check0_Scene1_asset_0()
        {
            try
            {
                this.check0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.check0.autoSize = "none";
            this.check0.enabled = true;
            this.check0.focusable = false;
            this.check0.groupName = "";
            this.check0.label = "";
            this.check0.overlayAlign = "none";
            this.check0.overlayImg = "";
            this.check0.overlayPadding = {x:0, y:0};
            this.check0.preventAutoSize = false;
            this.check0.selected = false;
            this.check0.visible = true;
            try
            {
                this.check0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_Scene1_asset_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = false;
            this.list.itemRendererName = "TreeItemRenderer";
            this.list.itemRendererInstanceName = "";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
            this.list.treeButtonClassName = "TreeButton";
            this.list.treeButtonGap = 10;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = true;
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

        function __setProp_comboSwf_Scene1_asset_0()
        {
            try
            {
                this.comboSwf["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSwf.autoSize = "none";
            this.comboSwf.dropdown = "DefaultScrollingList";
            this.comboSwf.enabled = true;
            this.comboSwf.focusable = true;
            this.comboSwf.groupName = "";
            this.comboSwf.itemRenderer = "DSListItemRenderer_h18";
            this.comboSwf.menuDirection = "down";
            this.comboSwf.menuMargin = 1;
            this.comboSwf.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSwf.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSwf.menuRowCount = 20;
            this.comboSwf.menuRowsFixed = false;
            this.comboSwf.menuWidth = -1;
            this.comboSwf.menuWrapping = "normal";
            this.comboSwf.overlayAlign = "none";
            this.comboSwf.overlayImg = "";
            this.comboSwf.overlayPadding = {x:0, y:0};
            this.comboSwf.preventAutoSize = false;
            this.comboSwf.scrollBar = "DefaultScrollBar";
            this.comboSwf.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSwf.visible = true;
            try
            {
                this.comboSwf["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_Scene1_asset_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 10;
            this.scrollBar.offsetBottom = 0;
            this.scrollBar.offsetTop = 0;
            this.scrollBar.scrollTarget = "list";
            this.scrollBar.trackMode = "scrollPage";
            this.scrollBar.visible = true;
            try
            {
                this.scrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCopy_Scene1_asset_0()
        {
            try
            {
                this.btnCopy["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCopy.autoRepeat = false;
            this.btnCopy.autoSize = "none";
            this.btnCopy.enabled = true;
            this.btnCopy.focusable = false;
            this.btnCopy.groupName = "";
            this.btnCopy.label = "Copy";
            this.btnCopy.overlayAlign = "none";
            this.btnCopy.overlayImg = "";
            this.btnCopy.overlayPadding = {x:0, y:0};
            this.btnCopy.preventAutoSize = false;
            this.btnCopy.selected = false;
            this.btnCopy.toggle = false;
            this.btnCopy.visible = true;
            try
            {
                this.btnCopy["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelInst_Scene1_asset_0()
        {
            try
            {
                this.labelInst["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelInst.autoSize = "left";
            this.labelInst.enabled = true;
            this.labelInst.text = "";
            this.labelInst.visible = true;
            try
            {
                this.labelInst["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelClass_Scene1_asset_0()
        {
            try
            {
                this.labelClass["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelClass.autoSize = "left";
            this.labelClass.enabled = true;
            this.labelClass.text = "";
            this.labelClass.visible = true;
            try
            {
                this.labelClass["componentInspectorSetting"] = false;
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
