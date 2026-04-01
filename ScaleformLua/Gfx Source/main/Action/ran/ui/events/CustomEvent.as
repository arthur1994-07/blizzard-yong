package ran.ui.events
{
    import flash.events.*;
    import flash.external.*;
    import ran.ui.utils.*;

    public class CustomEvent extends Object
    {
        public var instObj:Object;
        public var event:String;
        public var callBack:String;
        public var retParams:Array;
        public var delivery:Array;

        public function CustomEvent()
        {
            this.retParams = [];
            this.delivery = [];
            return;
        }// end function

        public function RegEvent(param1:Object, param2:String, param3:String, param4:Array, param5:Array) : void
        {
            this.instObj = param1;
            this.event = param2;
            this.callBack = param3;
            this.retParams = param4;
            if (param5 != null)
            {
                this.delivery = param5;
            }
            else
            {
                this.delivery = [];
            }
            param1.removeEventListener(param2, this.handleCustomEvent);
            if (param3 == "")
            {
                return;
            }
            param1.addEventListener(param2, this.handleCustomEvent, false, 0, true);
            return;
        }// end function

        public function RemoveEvent() : void
        {
            this.instObj.removeEventListener(this.event, this.handleCustomEvent);
            return;
        }// end function

        public function handleCustomEvent(event:Event) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_6:* = undefined;
            var _loc_7:* = 0;
            var _loc_8:* = 0;
            var _loc_9:* = 0;
            if (this.retParams.length == 0 && this.delivery.length == 0)
            {
                ExternalInterface.call("OnCustomEvent", this.callBack);
            }
            else
            {
                _loc_2 = [];
                _loc_3 = [];
                _loc_4 = 0;
                _loc_4 = 0;
                while (_loc_4 < this.retParams.length)
                {
                    
                    _loc_5 = this.retParams[_loc_4];
                    _loc_6 = event[_loc_5];
                    if (undefined == _loc_6)
                    {
                        _loc_2.push(Util.OBJ_TYPE_NULL);
                        _loc_3.push(0);
                    }
                    else
                    {
                        _loc_7 = Util.GetObjectType(_loc_6);
                        _loc_2.push(_loc_7);
                        if (Util.OBJ_TYPE_INT == _loc_7)
                        {
                            _loc_8 = int(_loc_6);
                            _loc_3.push(_loc_8);
                        }
                        else if (Util.OBJ_TYPE_UINT == _loc_7)
                        {
                            _loc_9 = uint(_loc_6);
                            _loc_3.push(_loc_9);
                        }
                        else
                        {
                            _loc_3.push(_loc_6);
                        }
                    }
                    _loc_4++;
                }
                _loc_4 = 0;
                while (_loc_4 < this.delivery.length)
                {
                    
                    _loc_2.push(Util.OBJ_TYPE_STRING);
                    _loc_3.push(this.delivery[_loc_4]);
                    _loc_4++;
                }
                ExternalInterface.call("OnCustomEvent", this.callBack, _loc_2, _loc_3);
            }
            return;
        }// end function

    }
}
