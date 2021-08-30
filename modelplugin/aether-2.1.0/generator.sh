#!/usr/bin/env bash

mkdir -p aether_2_1_0

go run github.com/openconfig/ygot/generator -path=../../../sdran-helm-charts/config-models/aether-2.1.x/files/yang \
       -output_file=aether_2_1_0/generated.go -package_name=aether_2_1_0 -generate_fakeroot --include_descriptions\
       aether-subscriber.yang apn-profile.yang up-profile.yang qos-profile.yang \
       access-profile.yang security-profile.yang enterprise.yang connectivity-service.yang \
       service-group.yang service-policy.yang service-rule.yang


sedi=(-i)
case "$(uname)" in
  Darwin*) sedi=(-i "")
esac

lf=$'\n'; sed "${sedi[@]}" -e "1s/^/\/\/ Code generated by YGOT. DO NOT EDIT.\\$lf/" aether_2_1_0/generated.go


