# Volumes, PV & PVC

## Topics Practiced

- Kubernetes Volumes
- PersistentVolume (PV)
- PersistentVolumeClaim (PVC)
- Pod with PVC
- Persistent storage testing

## Practice

1. Created a PersistentVolume.
2. Created a PersistentVolumeClaim.
3. Mounted PVC inside an Nginx Pod at `/data`.
4. Created `test.txt` inside `/data`.
5. Deleted and recreated the Pod.
6. Verified that the data persisted.

## Verification

```bash
kubectl get pv
kubectl get pvc
kubectl get pod
kubectl exec storage-pod -- df -h
kubectl exec storage-pod -- cat /data/test.txt
