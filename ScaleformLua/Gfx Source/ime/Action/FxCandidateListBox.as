package 
{
    import flash.display.*;

    public class FxCandidateListBox extends Object
    {
        private var ListObj:MovieClip;
        private var ItemName:String;
        private var SelectedItemIndex:Number;
        private var DisplayItems:Array;
        private var DisplayItemIndex:Number;
        private var Items:Array;
        private var ItemDataMap:Array;
        private var TextColor:Number;
        private var SelectedTextColor:Number;
        private var SelectedBackgroundColor:Number;
        private var BackgroundColor:Number;
        private var IndexBackgroundColor:Number;
        private var SelectedIndexBackgroundColor:Number;
        private var FontSize:Number;
        private var VisibleCount:Number;
        private var DisplayCallback:Function;

        public function FxCandidateListBox()
        {
            ListObj = null;
            ItemName = null;
            SelectedItemIndex = -1;
            DisplayItems = new Array();
            DisplayItemIndex = 0;
            Items = new Array();
            VisibleCount = 0;
            DisplayCallback = null;
            return;
        }// end function

        public function InitCandidateListDefaults(param1:Object) : void
        {
            SelectedBackgroundColor = param1.selectedBackgroundColor == undefined ? (9755539) : (param1.selectedBackgroundColor);
            IndexBackgroundColor = param1.indexBackgroundColor == undefined ? (12503505) : (param1.indexBackgroundColor);
            SelectedIndexBackgroundColor = param1.selectedIndexBackgroundColor == undefined ? (6994017) : (param1.selectedIndexBackgroundColor);
            SelectedTextColor = param1.selectedTextColor == undefined ? (16777215) : (param1.selectedTextColor);
            TextColor = param1.textColor == undefined ? (0) : (param1.textColor);
            BackgroundColor = param1.backgroundColor == undefined ? (15725300) : (param1.backgroundColor);
            FontSize = param1.fontSize == undefined ? (26) : (param1.fontSize);
            return;
        }// end function

        public function SetCandidateListProps(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number)
        {
            SelectedBackgroundColor = param4 >= 0 ? (param4) : (SelectedBackgroundColor);
            SelectedIndexBackgroundColor = param7 >= 0 ? (param7) : (SelectedIndexBackgroundColor);
            BackgroundColor = param3 >= 0 ? (param3) : (BackgroundColor);
            IndexBackgroundColor = param6 >= 0 ? (param6) : (IndexBackgroundColor);
            FontSize = param5 >= 0 ? (param5) : (FontSize);
            SelectedTextColor = param2 >= 0 ? (param2) : (SelectedTextColor);
            TextColor = param1 >= 0 ? (param1) : (TextColor);
            return;
        }// end function

        public function CreateCandidateList(param1:MovieClip, param2:Number, param3:String, param4:Number, param5:Number, param6:String, param7:Array, param8:Object)
        {
            var _loc_10:* = null;
            InitCandidateListDefaults(param8);
            var _loc_9:* = 0;
            while (_loc_9 < param2)
            {
                
                _loc_10 = new ListRow(this);
                param1.addChild(_loc_10);
                _loc_10.name = param3 + _loc_9;
                _loc_10.x = param4;
                _loc_10.y = param5;
                _loc_10.ID.autoSize = true;
                _loc_10.Value.autoSize = true;
                param5 = param5 + (_loc_10.height - 3);
                _loc_9 = _loc_9 + 1;
            }
            SetListObject(param1);
            SetItemDataMap(param7);
            SetItemName(param3);
            SetVisibleCount(param2);
            return;
        }// end function

        public function DestroyList() : void
        {
            var _loc_1:* = 0;
            while (_loc_1 < VisibleCount)
            {
                
                DisplayItems[_loc_1] = null;
                _loc_1 = _loc_1 + 1;
            }
            return;
        }// end function

        public function ClearList() : void
        {
            DisplayItemIndex = 0;
            SelectedItemIndex = -1;
            return;
        }// end function

        public function Add() : void
        {
            if (arguments.length < ItemDataMap.length)
            {
                trace("Not enough arguements passed to Add.");
                return;
            }
            if (DisplayItemIndex < DisplayItems.length)
            {
                DisplayItems[DisplayItemIndex].ItemData = arguments;
                var _loc_3:* = DisplayItemIndex + 1;
                DisplayItemIndex = _loc_3;
            }
            return;
        }// end function

        public function SetVisibleCount(param1:Number) : void
        {
            var _loc_3:* = undefined;
            VisibleCount = param1;
            DisplayItems.splice(0);
            var _loc_2:* = 0;
            while (_loc_2 < param1)
            {
                
                _loc_3 = new FxCandidateListItemInterface(MovieClip(ListObj.getChildByName(ItemName + _loc_2)));
                _loc_3.ItemDataMap = ItemDataMap;
                DisplayItems.push(_loc_3);
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        public function GetVisibleCount() : Number
        {
            return VisibleCount;
        }// end function

        private function GetItemAtIndex(param1:Number) : FxCandidateListItemInterface
        {
            return DisplayItems[param1];
        }// end function

        public function SetList() : void
        {
            var _loc_3:* = null;
            var _loc_4:* = undefined;
            if (ListObj == null)
            {
                trace("FxListBoxWidget::SetList - ListObj must be defined.");
                return;
            }
            if (ItemName == null)
            {
                trace("FxListBoxWidget::SetList - ItemName is undefined.");
                return;
            }
            var _loc_1:* = ItemDataMap.length;
            var _loc_2:* = 0;
            while (_loc_2 < VisibleCount)
            {
                
                _loc_3 = DisplayItems[_loc_2] as FxCandidateListItemInterface;
                _loc_4 = _loc_3.ItemObj;
                if (_loc_2 < DisplayItemIndex)
                {
                    _loc_4.visible = true;
                    if (SelectedItemIndex == _loc_2)
                    {
                        if (_loc_4 != null)
                        {
                            _loc_4.GotoOnState();
                        }
                    }
                    else if (_loc_4 != null)
                    {
                        _loc_4.GotoOffState();
                    }
                }
                if (_loc_2 >= DisplayItemIndex)
                {
                    _loc_4.visible = false;
                }
                _loc_2 = _loc_2 + 1;
            }
            if (DisplayCallback != null)
            {
                DisplayCallback(SelectedItemIndex);
            }
            return;
        }// end function

        public function SetItemDataMap(param1:Array)
        {
            var _loc_2:* = null;
            var _loc_3:* = undefined;
            ItemDataMap = param1;
            if (ItemDataMap.length > 0)
            {
                _loc_2 = ItemDataMap[0];
                _loc_3 = 1;
                while (_loc_3 < ItemDataMap.length)
                {
                    
                    _loc_2 = _loc_2 + ("," + ItemDataMap[_loc_3]);
                    _loc_3 = _loc_3 + 1;
                }
            }
            MovieClip(ListObj.parent).SendIMEMessage("CandidateList_OnSetItemDataMap", _loc_2);
            return;
        }// end function

        public function DisplayInfo(param1:String)
        {
            var _loc_2:* = null;
            _loc_2 = GetItem(param1);
            if (_loc_2 != null)
            {
                _loc_2.DisplayInfo();
            }
            return;
        }// end function

        private function GetItem(param1:String) : FxCandidateListItemInterface
        {
            if (ItemName == null)
            {
                return null;
            }
            if (param1 == null)
            {
                return null;
            }
            var _loc_2:* = parseInt(param1.substring(ItemName.length));
            return DisplayItems[_loc_2];
        }// end function

        public function SelectItem(param1:String)
        {
            SelectedItemIndex = parseInt(param1.substring(ItemName.length));
            MovieClip(ListObj.parent).SendIMEMessage("CandidateList_OnItemSelect", SelectedItemIndex);
            return;
        }// end function

        public function SelectDataItem(param1:Number)
        {
            SelectedItemIndex = param1;
            return;
        }// end function

        public function SetListObject(param1:MovieClip)
        {
            ListObj = param1;
            return;
        }// end function

        public function SetItemName(param1:String)
        {
            ItemName = param1;
            return;
        }// end function

        public function RegisterPostDisplayCallback(param1:Function)
        {
            DisplayCallback = param1;
            return;
        }// end function

    }
}
