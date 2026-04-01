package ran.ui.core
{
    import flash.display.*;

    public class MMapIcon extends MovieClip
    {
        protected var _tooltip:String = "";
        protected var _crowType:String = "";
        protected var _crowSubType:String = "";
        protected var _customID:String = "";
        protected var _mapID:String = "";

        public function MMapIcon()
        {
            return;
        }// end function

        public function set tooltip(param1:String) : void
        {
            this._tooltip = param1;
            return;
        }// end function

        public function get tooltip() : String
        {
            return this._tooltip;
        }// end function

        public function set crowType(param1:String) : void
        {
            this._crowType = param1;
            return;
        }// end function

        public function get crowType() : String
        {
            return this._crowType;
        }// end function

        public function set crowSubType(param1:String) : void
        {
            this._crowSubType = param1;
            return;
        }// end function

        public function get crowSubType() : String
        {
            return this._crowSubType;
        }// end function

        public function set customID(param1:String) : void
        {
            this._customID = param1;
            return;
        }// end function

        public function get customID() : String
        {
            return this._customID;
        }// end function

        public function set mapID(param1:String) : void
        {
            this._mapID = param1;
            return;
        }// end function

        public function get mapID() : String
        {
            return this._mapID;
        }// end function

    }
}
