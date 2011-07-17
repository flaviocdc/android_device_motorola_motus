#include<camera/Camera.h>
#include "QualcommCameraHardware.h"

namespace android {

extern "C" sp<CameraHardwareInterface> openCameraHardware();

static const CameraInfo sCameraInfo[] = {
    {
        CAMERA_FACING_BACK,
        90,  /* orientation */
    },
    {
        CAMERA_FACING_FRONT,
        90, /* orientation */
    }
};

static int getNumberOfCameras() {
  return 2;
}

extern "C" int HAL_getNumberOfCameras()
{
    return getNumberOfCameras();
}

extern "C" void HAL_getCameraInfo(int cameraId, struct CameraInfo* cameraInfo)
{
    memcpy(cameraInfo, &sCameraInfo[cameraId], sizeof(CameraInfo));
}

extern "C" sp<CameraHardwareInterface> HAL_openCameraHardware(int cameraId)
{
    LOGV("openCameraHardware: call createInstance");
    return openCameraHardware();
}

}
