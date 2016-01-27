//
// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements. See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership. The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License. You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>

// host order to network order (64-bit)
static int64_t htonll(uint64_t data) {
  uint32_t d1 = htonl((uint32_t)data);
  uint32_t d2 = htonl((uint32_t)(data >> 32));
  return ((uint64_t)d1 << 32) + (uint64_t)d2;
}

// network order to host order (64-bit)
static int64_t ntohll(uint64_t data) {
  uint32_t d1 = ntohl((uint32_t)data);
  uint32_t d2 = ntohl((uint32_t)(data >> 32));
  return ((uint64_t)d1 << 32) + (uint64_t)d2;
}

void pack_long(char* buf, int64_t data) {
    int64_t d = htonll((uint64_t)data);
    memcpy(buf, &d, 8);
}

void pack_double(char* buf, double data) {
    int64_t val;
    memcpy(&val, &data, sizeof(data));
    pack_long(buf, val);
}

double unpack_double(char* buf) {
    uint64_t val;
    double ret;
    memcpy(&val, buf, sizeof(double));
    val = (uint64_t)ntohll(val);
    memcpy(&ret, &val, sizeof(double));
    return ret;
}
