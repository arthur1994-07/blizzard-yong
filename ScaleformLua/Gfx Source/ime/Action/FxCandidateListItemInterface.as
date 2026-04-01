package 
{
    import flash.display.*;

    public class FxCandidateListItemInterface extends Object
    {
        public var ItemObj:Object;
        public var ItemDataMap:Array;
        public var ItemData:Array;

        public function FxCandidateListItemInterface(param1:MovieClip)
        {
            ItemObj = param1;
            return;
        }// end function

        public function GetData(param1:String)
        {
            var _loc_2:* = 0;
            while (_loc_2 < ItemDataMap.length)
            {
                
                if (ItemDataMap[_loc_2] == param1)
                {
                    return ItemData[_loc_2];
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        public function DisplayInfo()
        {
            var _loc_2:* = undefined;
            var _loc_1:* = 0;
            while (_loc_1 < ItemDataMap.length)
            {
                
                _loc_2 = ItemObj[ItemDataMap[_loc_1]];
                if (_loc_2 != null && _loc_2 != undefined && ItemData != null)
                {
                    _loc_2.replaceText(0, _loc_2.length, ItemData[_loc_1]);
                }
                _loc_1 = _loc_1 + 1;
            }
            return;
        }// end function

    }
}
