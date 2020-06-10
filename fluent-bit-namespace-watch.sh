#!/bin/sh

interval="${SLEEP_INTERVAL:-"60"}"
ds_name="${DAEMONSET_NAME:-"fluent-bit"}"

# Get a hash of the current namespaces
namespaces_hash=$(kubectl get ns --no-headers | awk '{print $1}' | md5sum)
new_namespaces_hash=${namespaces_hash}

# Loop until list of namespaces change
until [ "${namespaces_hash}" != "${new_namespaces_hash}" ]; do
  sleep ${sleep_interval};

  new_namespaces_hash=$(kubectl get ns --no-headers | awk '{print $1}' | md5sum)
  if [ "$?" != "0" ];then
    # If getting the new hash fails, invalidate the check
    new_namespaces_hash=${namespaces_hash}
  fi
done

echo "Change in namespaces detected, restarting to update filters"
kubectl rollout restart ds/"${ds_name}"
