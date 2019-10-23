%%--------------------------------------------------------------------
%% Copyright (c) 2019 EMQ Technologies Co., Ltd. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(ekka_locker_SUITE).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

all() -> ekka_ct:all(?MODULE).

init_per_testcase(_TestCase, Config) ->
    Config.

end_per_testcase(_TestCase, Config) ->
    Config.

t_acquire(_) ->
    error('TODO').

t_acquire_lock(_) ->
    error('TODO').

t_release(_) ->
    error('TODO').

t_release_lock(_) ->
    error('TODO').

t_acquire_local(_Conf) ->
    Node = node(),
    {ok, Locker} = ekka_locker:start_link(test_locker),
    ?assertEqual({true, [Node]}, ekka_locker:acquire(test_locker, resource1)),
    ?assertEqual({true, [Node]}, ekka_locker:acquire(test_locker, resource1)),
    ?assertEqual({true, [Node]}, ekka_locker:release(test_locker, resource1)),
    ?assertEqual({false, [Node]}, ekka_locker:release(test_locker, resource1)),
    ekka_locker:stop(Locker).

